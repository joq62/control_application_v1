%% This is the application resource file (.app file) for the 'base'
%% application.
{application, common,
[{description, "common" },
{vsn, "1.0.0" },
{modules, 
	  [common_app,common_sup,common]},
{registered,[common]},
{applications, [kernel,stdlib]},
{mod, {common_app,[]}},
{start_phases, []}
]}.
