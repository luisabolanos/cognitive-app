-- 20260923000013_seed_initial_catalog.sql
-- Catalogo inicial de idiomas, categorias, ejercicios y traducciones.
-- Estos datos forman parte del producto y por eso se versionan como
-- una migracion, no como seed de produccion.
-- ============================================================

-- ============================================================
-- LANGUAGES
-- ============================================================

insert into public.languages (code, name, is_active)
values
    ('es', 'Español', true),
    ('en', 'English', true)
on conflict (code) do nothing;

-- ============================================================
-- EXERCISE CATEGORIES
-- ============================================================

insert into public.exercise_categories (code)
values
    ('WORKING_MEMORY'),
    ('ATTENTION'),
    ('INHIBITION'),
    ('COGNITIVE_FLEXIBILITY'),
    ('PROCESSING_SPEED'),
    ('LOGICAL_REASONING'),
    ('VISUOSPATIAL'),
    ('LANGUAGE'),
    ('PLANNING'),
    ('PROBLEM_SOLVING')
on conflict (code) do nothing;

-- ============================================================
-- EXERCISES
-- ============================================================

insert into public.exercises (category_id, code, is_active)
select
    c.id,
    v.exercise_code,
    true
from (
    values
        ('WORKING_MEMORY', 'N_BACK'),
        ('WORKING_MEMORY', 'SEQUENCE_MEMORY'),
        ('WORKING_MEMORY', 'SPATIAL_MEMORY'),
        ('ATTENTION', 'SELECTIVE_ATTENTION'),
        ('ATTENTION', 'VISUAL_SEARCH'),
        ('INHIBITION', 'GO_NO_GO'),
        ('INHIBITION', 'STROOP'),
        ('COGNITIVE_FLEXIBILITY', 'TASK_SWITCHING'),
        ('PROCESSING_SPEED', 'REACTION_TIME'),
        ('PROCESSING_SPEED', 'SYMBOL_DIGIT'),
        ('LOGICAL_REASONING', 'LOGIC_SERIES'),
        ('LOGICAL_REASONING', 'VISUAL_MATRICES'),
        ('VISUOSPATIAL', 'MENTAL_ROTATION'),
        ('VISUOSPATIAL', 'CORSI_BLOCKS'),
        ('LANGUAGE', 'VERBAL_MEMORY'),
        ('LANGUAGE', 'VERBAL_FLUENCY'),
        ('COGNITIVE_FLEXIBILITY', 'TRAIL_MAKING'),
        ('PLANNING', 'TOWER_PLANNING'),
        ('PROBLEM_SOLVING', 'PROBLEM_SOLVING'),
        ('WORKING_MEMORY', 'DIGIT_SPAN')
) as v(category_code, exercise_code)
join public.exercise_categories c
    on c.code = v.category_code
on conflict (code) do nothing;

-- ============================================================
-- CATEGORY TRANSLATIONS - ESPAÑOL
-- ============================================================

insert into public.exercise_category_translations
    (category_id, language_id, name, description)
select
    c.id,
    l.id,
    v.name,
    v.description
from (
    values
        ('WORKING_MEMORY', 'Memoria de trabajo', 'Capacidad para mantener y manipular información temporalmente.'),
        ('ATTENTION', 'Atención', 'Capacidad para seleccionar y mantener la atención sobre información relevante.'),
        ('INHIBITION', 'Inhibición', 'Capacidad para controlar respuestas automáticas o impulsivas.'),
        ('COGNITIVE_FLEXIBILITY', 'Flexibilidad cognitiva', 'Capacidad para cambiar entre reglas, tareas o estrategias.'),
        ('PROCESSING_SPEED', 'Velocidad de procesamiento', 'Rapidez para procesar información y responder ante estímulos.'),
        ('LOGICAL_REASONING', 'Razonamiento lógico', 'Capacidad para identificar patrones, relaciones y reglas.'),
        ('VISUOSPATIAL', 'Visoespacial', 'Capacidad para procesar y manipular información espacial y visual.'),
        ('LANGUAGE', 'Lenguaje', 'Procesamiento y producción de información verbal.'),
        ('PLANNING', 'Planificación', 'Capacidad para organizar acciones para alcanzar un objetivo.'),
        ('PROBLEM_SOLVING', 'Resolución de problemas', 'Capacidad para encontrar soluciones aplicando reglas y restricciones.')
) as v(category_code, name, description)
join public.exercise_categories c
    on c.code = v.category_code
join public.languages l
    on l.code = 'es'
on conflict (category_id, language_id) do nothing;

-- ============================================================
-- CATEGORY TRANSLATIONS - ENGLISH
-- ============================================================

insert into public.exercise_category_translations
    (category_id, language_id, name, description)
select
    c.id,
    l.id,
    v.name,
    v.description
from (
    values
        ('WORKING_MEMORY', 'Working Memory', 'Ability to temporarily maintain and manipulate information.'),
        ('ATTENTION', 'Attention', 'Ability to select and maintain attention on relevant information.'),
        ('INHIBITION', 'Inhibition', 'Ability to control automatic or impulsive responses.'),
        ('COGNITIVE_FLEXIBILITY', 'Cognitive Flexibility', 'Ability to switch between rules, tasks, or strategies.'),
        ('PROCESSING_SPEED', 'Processing Speed', 'Speed at which information is processed and responses are generated.'),
        ('LOGICAL_REASONING', 'Logical Reasoning', 'Ability to identify patterns, relationships, and rules.'),
        ('VISUOSPATIAL', 'Visuospatial', 'Ability to process and manipulate spatial and visual information.'),
        ('LANGUAGE', 'Language', 'Processing and production of verbal information.'),
        ('PLANNING', 'Planning', 'Ability to organize actions to achieve a goal.'),
        ('PROBLEM_SOLVING', 'Problem Solving', 'Ability to find solutions by applying rules and constraints.')
) as v(category_code, name, description)
join public.exercise_categories c
    on c.code = v.category_code
join public.languages l
    on l.code = 'en'
on conflict (category_id, language_id) do nothing;

-- ============================================================
-- EXERCISE TRANSLATIONS - ESPAÑOL
-- ============================================================

insert into public.exercise_translations
    (exercise_id, language_id, name, description)
select
    e.id,
    l.id,
    v.name,
    v.description
from (
    values
        ('N_BACK', 'N-Back', 'Identifica si el estímulo actual coincide con uno presentado anteriormente.'),
        ('SEQUENCE_MEMORY', 'Memoria de secuencias', 'Recuerda y reproduce correctamente una secuencia de estímulos.'),
        ('SPATIAL_MEMORY', 'Memoria espacial', 'Recuerda las posiciones de los estímulos dentro de un espacio.'),
        ('SELECTIVE_ATTENTION', 'Atención selectiva', 'Identifica los estímulos relevantes entre diferentes distractores.'),
        ('VISUAL_SEARCH', 'Búsqueda visual', 'Encuentra un estímulo objetivo dentro de un conjunto de elementos.'),
        ('GO_NO_GO', 'Go / No-Go', 'Responde ante determinados estímulos e inhibe la respuesta ante otros.'),
        ('STROOP', 'Stroop', 'Responde correctamente ante estímulos que contienen información conflictiva.'),
        ('TASK_SWITCHING', 'Cambio de tareas', 'Alterna entre diferentes reglas o tareas.'),
        ('REACTION_TIME', 'Tiempo de reacción', 'Responde lo más rápido posible ante un estímulo.'),
        ('SYMBOL_DIGIT', 'Símbolo-dígito', 'Relaciona símbolos con números siguiendo una regla determinada.'),
        ('LOGIC_SERIES', 'Series lógicas', 'Identifica patrones y continúa secuencias lógicas.'),
        ('VISUAL_MATRICES', 'Matrices visuales', 'Resuelve patrones visuales y determina el elemento faltante.'),
        ('MENTAL_ROTATION', 'Rotación mental', 'Identifica equivalencias entre objetos mediante rotación mental.'),
        ('CORSI_BLOCKS', 'Bloques de Corsi', 'Recuerda y reproduce secuencias de posiciones espaciales.'),
        ('VERBAL_MEMORY', 'Memoria verbal', 'Recuerda y reconoce información verbal.'),
        ('VERBAL_FLUENCY', 'Fluidez verbal', 'Genera palabras siguiendo reglas o categorías determinadas.'),
        ('TRAIL_MAKING', 'Trail Making', 'Conecta elementos siguiendo una secuencia o regla determinada.'),
        ('TOWER_PLANNING', 'Planificación de torres', 'Resuelve problemas mediante la planificación de movimientos.'),
        ('PROBLEM_SOLVING', 'Resolución de problemas', 'Resuelve problemas aplicando restricciones y reglas.'),
        ('DIGIT_SPAN', 'Retención de dígitos', 'Recuerda y reproduce secuencias de números.')
) as v(exercise_code, name, description)
join public.exercises e
    on e.code = v.exercise_code
join public.languages l
    on l.code = 'es'
on conflict (exercise_id, language_id) do nothing;

-- ============================================================
-- EXERCISE TRANSLATIONS - ENGLISH
-- ============================================================

insert into public.exercise_translations
    (exercise_id, language_id, name, description)
select
    e.id,
    l.id,
    v.name,
    v.description
from (
    values
        ('N_BACK', 'N-Back', 'Identify whether the current stimulus matches one presented previously.'),
        ('SEQUENCE_MEMORY', 'Sequence Memory', 'Remember and correctly reproduce a sequence of stimuli.'),
        ('SPATIAL_MEMORY', 'Spatial Memory', 'Remember the positions of stimuli within a space.'),
        ('SELECTIVE_ATTENTION', 'Selective Attention', 'Identify relevant stimuli among different distractors.'),
        ('VISUAL_SEARCH', 'Visual Search', 'Find a target stimulus within a set of elements.'),
        ('GO_NO_GO', 'Go / No-Go', 'Respond to certain stimuli and inhibit the response to others.'),
        ('STROOP', 'Stroop', 'Respond correctly to stimuli containing conflicting information.'),
        ('TASK_SWITCHING', 'Task Switching', 'Switch between different rules or tasks.'),
        ('REACTION_TIME', 'Reaction Time', 'Respond as quickly as possible to a stimulus.'),
        ('SYMBOL_DIGIT', 'Symbol Digit', 'Match symbols with numbers according to a given rule.'),
        ('LOGIC_SERIES', 'Logic Series', 'Identify patterns and continue logical sequences.'),
        ('VISUAL_MATRICES', 'Visual Matrices', 'Solve visual patterns and determine the missing element.'),
        ('MENTAL_ROTATION', 'Mental Rotation', 'Identify equivalent objects through mental rotation.'),
        ('CORSI_BLOCKS', 'Corsi Blocks', 'Remember and reproduce sequences of spatial positions.'),
        ('VERBAL_MEMORY', 'Verbal Memory', 'Remember and recognize verbal information.'),
        ('VERBAL_FLUENCY', 'Verbal Fluency', 'Generate words according to specific rules or categories.'),
        ('TRAIL_MAKING', 'Trail Making', 'Connect elements according to a sequence or rule.'),
        ('TOWER_PLANNING', 'Tower Planning', 'Solve problems by planning a sequence of movements.'),
        ('PROBLEM_SOLVING', 'Problem Solving', 'Solve problems by applying constraints and rules.'),
        ('DIGIT_SPAN', 'Digit Span', 'Remember and reproduce sequences of numbers.')
) as v(exercise_code, name, description)
join public.exercises e
    on e.code = v.exercise_code
join public.languages l
    on l.code = 'en'
on conflict (exercise_id, language_id) do nothing;
