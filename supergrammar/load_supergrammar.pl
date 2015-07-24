:-prolog_load_context(directory, Dir)
  ,asserta(user:file_search_path(supergrammar, Dir)).

% Corpus files.
user:file_search_path(corpus, supergrammar(corpus)).
% Directory for examples and language modules
user:file_search_path(language, supergrammar(languages)).
user:file_search_path(output, supergrammar(output)).

% Double-debug statements make sure we also get output to the listener.
% Though it makes it harder to see what's being debugged...
:-debug(next_example > 'debug.log').
:-debug(next_example).
%:-nodebug(update_augmentation_set).
:-debug(update_augmentation_set > 'debug.log').
:-debug(new_production).
:-debug(new_production > 'debug.log').
%:-nodebug(update_grammar).
:-debug(update_grammar > 'debug.log').
%:-nodebug(write_to_database).
:-debug(write_to_database > 'debug.log').
%:-nodebug(prune_corpus).
:-debug(prune_corpus > 'debug.log').
%:-nodebug(augment_production).
:-debug(augment_production > 'debug.log').
%:-nodebug(score_production).
:-debug(score_production > 'debug.log').


% Loads configuration predicates into global module user where
% configuration module can access them.
:-use_module(load_configuration).
%:-use_module(supergrammar).
:-use_module(stochastic_supergrammar).

:-load_test_files([]).

%!	edit_source is det.
%
%	Opens work files in the editor.

edit_source:-
	edit(supergrammar(load_supergrammar))
	,edit(supergrammar(utilities))
	,edit(supergrammar(stochastic_supergrammar))
	%,edit(supergrammar('stochastic_supergrammar.plt'))
	,edit(supergrammar(configuration))
	,edit(supergrammar(load_configuration))
	% Load configured language and examples files :D
	,configuration:language_module(Language)
	,configuration:examples_module(Examples)
	,edit(language(Language))
	,edit(language(Examples))

	% Might still need this
	%,edit('C:\\Users\\spatsant\\AppData\\Roaming\\SWI-Prolog\\swipl.ini')
	.

:-edit_source.



