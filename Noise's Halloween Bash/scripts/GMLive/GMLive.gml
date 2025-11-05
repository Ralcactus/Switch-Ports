global.g_live_token_constructors = ["header", "macro_def", "macro_start", "hash", "semico", "comma", "period", "colon", "qmark", "at_sign", "dollar_sign", "keyword", "ident", "undefined_hx", "boolean", "number", "cstring", "un_op", "adjfix", "bin_op", "set_op", "par_open", "par_close", "sqb_open", "sqb_close", "cub_open", "cub_close", "arg_const", "null_co", "null_co_set", "pragma"];
global.g_live_node_def_constructors = ["undefined_hx", "boolean", "number", "cstring", "other_const", "enum_ctr", "array_decl", "object_decl", "ensure_array_for_local", "ensure_array_for_global", "ensure_array_for_field", "ensure_array_for_index", "ensure_array_for_index2d", "ident", "self_hx", "other_hx", "global_ref", "script", "native_script", "const", "arg_const", "arg_index", "arg_count", "call", "call_script", "call_script_at", "call_script_id", "call_script_with_array", "call_field", "call_func", "call_func_at", "construct", "func_literal", "prefix", "postfix", "un_op", "bin_op", "set_op", "delete_hx", "null_co", "to_bool", "from_bool", "in", "local_hx", "local_set", "local_aop", "static_hx", "static_set", "static_aop", "global_hx", "global_set", "global_aop", "script_static", "script_static_set", "script_static_aop", "field", "field_set", "field_aop", "env", "env_set", "env_aop", "env_fd", "env_fd_set", "env_fd_aop", "env1d", "env1d_set", "env1d_aop", "alarm", "alarm_set_hx", "alarm_aop", "index", "index_set", "index_aop", "index2d", "index2d_set", "index2d_aop", "raw_id", "raw_id_set", "raw_id_aop", "raw_id2d", "raw_id2d_set", "raw_id2d_aop", "ds_list", "ds_list_set_hx", "ds_list_aop", "ds_map", "ds_map_set_hx", "ds_map_aop", "ds_grid", "ds_grid_set_hx", "ds_grid_aop", "key_id", "key_id_set", "key_id_aop", "var_decl", "block", "if_then", "ternary", "switch_hx", "wait", "fork", "while_hx", "do_until", "do_while", "repeat_hx", "for_hx", "with_hx", "once", "return_hx", "exit_hx", "break_hx", "continue_hx", "debugger", "try_catch", "throw_hx"];
global.mq_live_pos = [undefined, undefined, 0, 0, undefined, 0];
global.mq_live_scope = [undefined, undefined, 0, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined];

function sprite_set_live(arg0, arg1)
{
}

function path_set_live(arg0, arg1)
{
}

function animcurve_set_live(arg0, arg1, arg2 = 16)
{
}

function file_set_live(arg0, arg1, arg2)
{
}

function room_set_live(arg0, arg1)
{
}

function room_goto_live(arg0)
{
    room_goto(arg0);
}

function live_call()
{
    return false;
}

function live_defcall()
{
    return false;
}

function live_call_ext(arg0)
{
    return false;
}

function live_defcall_ext(arg0, arg1)
{
    return false;
}

function live_auto_call_1()
{
    return false;
}

function live_auto_call_2(arg0)
{
    return false;
}

function live_async_http(arg0)
{
}

function shader_set_live(arg0, arg1)
{
}

function live_method(arg0, arg1)
{
    return method(arg0, arg1);
}

function live_method_get_self(arg0)
{
    return method_get_self(arg0);
}

function live_thread_method_script()
{
    return undefined;
}

function live_update_script_impl(arg0, arg1, arg2)
{
}

function live_constant_add(arg0, arg1)
{
}

function live_constant_delete(arg0)
{
    return false;
}

function live_variable_add(arg0, arg1)
{
}

function live_variable_delete(arg0)
{
    return false;
}

function live_function_add(arg0, arg1)
{
}

function live_function_delete(arg0)
{
    return false;
}

function live_throw_error(arg0)
{
}

function live_execute_string(arg0)
{
    return false;
}

function live_snippet_create(arg0, arg1 = "snippet")
{
    return undefined;
}

function live_snippet_destroy(arg0)
{
}

function live_snippet_call(arg0)
{
    return false;
}

function live_update()
{
}

function live_init(arg0, arg1, arg2)
{
}

function live_room_start()
{
}

function vm_v2_GmlStructBase() constructor
{
    static __class__ = global.mt_vm_v2_GmlStructBase;
}
