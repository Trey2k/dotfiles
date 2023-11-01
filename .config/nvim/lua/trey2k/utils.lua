local utils = {}

utils.current_task = nil

utils.setup_tasks = function(opts)
	local launch_task_keymap = "<leader>tr"

	if opts and opts.launch_task_keymap then
		launch_task_keymap = opts.launch_task_keymap
	end

	utils.tasks = {}
	vim.keymap.set("n", launch_task_keymap, utils.launch_task)
end

utils.add_task = function(name, cmd, cwd)
	if cwd == nil then
		cwd = vim.fn.getcwd()
	end

	local task = {
		name = name,
		command = cmd,
		cwd = cwd,
		job_id = 0
	}

	table.insert(utils.tasks, task)
end

utils.launch_task = function()
	if utils.tasks == 0 then
		vim.print("No tasks to run")
		return
	end

	vim.ui.select(utils.tasks, {
		prompt = "Select task: ",
		format_item = function(task)
			return task.name
		end,
	}, utils.run_task)
end

utils.run_task = function(task)
	if task == nil then
		vim.print("No task selected")
		return
	end

	if utils.current_task ~= nil then
		vim.print("Task already running")
		return
	end

	local cmd = task.command
	local cwd = task.cwd

	-- New window for task at bottom
	vim.cmd("botright new")

	vim.print("\nRunning task: " .. task.name)
	local job = vim.fn.termopen(cmd, {
		on_exit = function(job_id, exit_code, event)
			vim.print("Task '" .. task.name .. "' finished with exit code: " .. exit_code)
			utils.current_task = nil
		end,
		cwd = cwd
	})

	task.job_id = job
	utils.current_task = task
end

-- Load VSCode launch.json file, if path is nil, then it is loaded
-- from .vscode/launch.json
utils.load_launch_json = function(path)
	require('dap.ext.vscode').load_launchjs(path, {
		codelldb = {'cpp', 'c', 'h', 'hpp', 'zig'}
	})
end

return utils
