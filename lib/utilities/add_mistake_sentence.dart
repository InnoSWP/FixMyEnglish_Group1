import '../models/sentence.dart';
import '../widgets/mistake_sentence.dart';

/// A function to add [sentence] to list [sentences].
///
/// This function simply takes data from [sentence] and
/// by using [MistakeSentence] widget convert it into full working widget with
/// hover on match, description of error etc.
void addSentence(Sentence sentence, List sentences) {
  sentences.add(MistakeSentence(
    label: sentence.label,
    text: sentence.text,
    suggestion: sentence.suggestion,
    error: sentence.error,
  ));
}
