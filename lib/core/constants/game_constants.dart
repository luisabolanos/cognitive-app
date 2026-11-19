/// Constantes para el motor de juegos, dificultad adaptativa y codigos de ejercicios.
class GameConstants {
  const GameConstants._();

  // Niveles de dificultad
  static const int minDifficultyLevel = 1;
  static const int maxDifficultyLevel = 10;

  // Umbrales de precision (%) para dificultad adaptativa
  static const double levelUpAccuracyThreshold = 85.0;
  static const double levelDownAccuracyThreshold = 50.0;

  // Tiempos de transicion en la interfaz de juego
  static const int countdownSeconds = 3;
  static const Duration feedbackDisplayDuration = Duration(milliseconds: 600);

  // Codigos de categorias cognitivas
  static const String categoryWorkingMemory = 'WORKING_MEMORY';
  static const String categoryAttention = 'ATTENTION';
  static const String categoryInhibition = 'INHIBITION';
  static const String categoryCognitiveFlexibility = 'COGNITIVE_FLEXIBILITY';
  static const String categoryProcessingSpeed = 'PROCESSING_SPEED';
  static const String categoryLogicalReasoning = 'LOGICAL_REASONING';
  static const String categoryVisuospatial = 'VISUOSPATIAL';
  static const String categoryLanguage = 'LANGUAGE';
  static const String categoryPlanning = 'PLANNING';
  static const String categoryProblemSolving = 'PROBLEM_SOLVING';

  // Codigos de los 20 ejercicios
  static const String nBack = 'N_BACK';
  static const String sequenceMemory = 'SEQUENCE_MEMORY';
  static const String spatialMemory = 'SPATIAL_MEMORY';
  static const String selectiveAttention = 'SELECTIVE_ATTENTION';
  static const String visualSearch = 'VISUAL_SEARCH';
  static const String goNoGo = 'GO_NO_GO';
  static const String stroop = 'STROOP';
  static const String taskSwitching = 'TASK_SWITCHING';
  static const String reactionTime = 'REACTION_TIME';
  static const String symbolDigit = 'SYMBOL_DIGIT';
  static const String logicSeries = 'LOGIC_SERIES';
  static const String visualMatrices = 'VISUAL_MATRICES';
  static const String mentalRotation = 'MENTAL_ROTATION';
  static const String corsiBlocks = 'CORSI_BLOCKS';
  static const String verbalMemory = 'VERBAL_MEMORY';
  static const String verbalFluency = 'VERBAL_FLUENCY';
  static const String trailMaking = 'TRAIL_MAKING';
  static const String towerPlanning = 'TOWER_PLANNING';
  static const String problemSolving = 'PROBLEM_SOLVING';
  static const String digitSpan = 'DIGIT_SPAN';
}
