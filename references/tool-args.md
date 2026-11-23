# sysplorer-mcp-server tool arguments (verified, MCP 0.6)

Call shape through Mogick:

```json
{"server": "sysplorer-mcp-server", "tool": "check_model", "args": {"model_name": "Pkg.Model"}}
```

Only the tools below exist (15). Anything else returns `tool_qualified_miss`.

## model_manager (lifecycle)

`action` is required: `new` | `open` | `load_file` | `unload` | `save` | `save_as`.

| Goal | args |
|---|---|
| Load a package or file | `{"action": "load_file", "file_path": "C:\\abs\\Pkg\\package.mo"}` |
| Reload after editing | `{"action": "load_file", "file_path": "C:\\abs\\Pkg\\package.mo", "force_reload": true}` |
| Open a loaded class in GUI | `{"action": "open", "model_name": "Pkg.Model"}` |
| Unload | `{"action": "unload", "model_name": "Pkg"}` |
| Save in place | `{"action": "save", "model_name": "Pkg.Model", "file_path": "C:\\abs\\Pkg\\Model.mo"}` |
| Save to new file | `{"action": "save_as", "model_name": "Pkg.Model", "file_path": "C:\\abs\\out\\Model.mo"}` |

`open` / `unload` take a class name, never a path. `load_file` takes a path, never a class name.

## check_model / translate_model / simulate_model

| Tool | args |
|---|---|
| check_model | `{"model_name": "Pkg.Model"}` or `{"model_names": ["Pkg.A", "Pkg.B"]}` |
| translate_model | `{"model_name": "Pkg.Model"}` |
| simulate_model | `{"model_name": "Pkg.Model", "verify_result_var": "mass.s"}` |
| simulate_model with time window | `{"model_name": "Pkg.Model", "target_time": [0, 20]}` |

`simulate_model` reads StopTime from `annotation(experiment(...))` unless `target_time` is given.

## model_inspect (read-only)

`action` is required. Valid actions only:
`get_classes`, `get_components`, `get_component_ports`, `get_component_type_name`,
`get_model_text`, `get_model_description`, `get_component_description`,
`lookup_component`, `get_last_errors`.

| Goal | args |
|---|---|
| Children of a package | `{"action": "get_classes", "model_name": "Modelica.Blocks.Sources"}` |
| Top-level packages | `{"action": "get_classes", "model_name": ""}` |
| Components of a model | `{"action": "get_components", "model_name": "Pkg.Model"}` |
| Model source text | `{"action": "get_model_text", "model_name": "Pkg.Model"}` |
| Last errors | `{"action": "get_last_errors"}` |

The key is always `model_name` (not `class_name`).

## get_lib_model_document

`{"full_class_names": ["Modelica.Mechanics.Translational.Components.Mass", "Modelica.Blocks.Sources.Sine"]}`
or `{"full_class_name": "Modelica.Blocks.Sources.Sine"}`. Max 50 per call.

## result_manager

| Goal | args |
|---|---|
| List result variables | `{"action": "get_result_variables", "model_name": "Pkg.Model"}` |
| Value at end | `{"action": "get_var_value_at", "var_name": "mass.s", "time_point": "end"}` |
| Value at time | `{"action": "get_var_value_at", "var_name": "mass.s", "time_point": 2.5}` |
| Several values | `{"action": "get_vars_value_at", "var_names": ["mass.s", "mass.v"]}` |
| Full series | `{"action": "get_var_values", "var_name": "mass.s"}` |

## plot_manager

`{"action": "plot_variables", "variables": ["mass.s", "mass.v"]}` or
`{"action": "create_animation"}` (MultiBody models).

## load_library

`{"action": "installed"}` lists libraries. `{"action": "load", "library_name": "TYMechanics"}` loads one.
Modelica 4.0.0.TY.1 is loaded by default.

## resources_retrieval (search bundled docs)

`action` and, for search, `query` are required (not `keyword`, not `mode`).

`{"action": "corpora"}` then
`{"action": "search", "query": "translational spring damper", "top_k": 5}`.

## get_api_document

`{"api_function_name": "GetComponents"}`. Only for raw ModelingPy API names
(not MCP tool names).

## call_code (last resort)

`mode` and `payload` are both required. `mode` is always `"run_sysplorer_api"`.

```json
{"mode": "run_sysplorer_api",
 "payload": {"output_paths": [],
             "python_source": "import mworks.sysplorer as ModelingPy\nprint(ModelingPy.ClassExist('Modelica.Blocks.Sources.Sine'))"}}
```

Never call ClearAll, ChangeDirectory, ChangeSimResultDirectory or Exit.

## session_manager

`{"action": "health"}` | `{"action": "get_directory"}` | `{"action": "get_loaded_models"}`
| `{"action": "get_installed_libraries"}`.
