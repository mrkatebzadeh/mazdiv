local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	{ "<leader>k", group = "Flutter", nowait = true, remap = false },
	{ "<leader>kD", ":FlutterDevTools<CR>", desc = "Dev Tools", nowait = true, remap = false },
	{ "<leader>kH", ":FlutterRestart<CR>", desc = "Restart", nowait = true, remap = false },
	{ "<leader>kc", ":FlutterCopyProfilerUrl<CR>", desc = "Copy Profile Url", nowait = true, remap = false },
	{ "<leader>kd", ":FlutterDevices<CR>", desc = "Devices", nowait = true, remap = false },
	{ "<leader>ke", ":FlutterEmulators<CR>", desc = "Emulators", nowait = true, remap = false },
	{ "<leader>kh", ":FlutterReload<CR>", desc = "Reload", nowait = true, remap = false },
	{ "<leader>kl", ":FlutterLogClear<CR>", desc = "Log Clear", nowait = true, remap = false },
	{ "<leader>ko", ":FlutterOutline<CR>", desc = "Outline", nowait = true, remap = false },
	{ "<leader>kp", ":FlutterPubGet<CR>", desc = "Pub Get", nowait = true, remap = false },
	{ "<leader>kq", ":FlutterQuit<CR>", desc = "Quit", nowait = true, remap = false },
	{ "<leader>kr", ":FlutterRun<CR>", desc = "Run", nowait = true, remap = false },
	{ "<leader>kv", ":FlutterVisualDebug<CR>", desc = "Visual Debug", nowait = true, remap = false },
}
which_key.add(mappings)
