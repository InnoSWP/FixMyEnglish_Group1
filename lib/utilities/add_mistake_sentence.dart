import '../models/sentence.dart';
import '../widgets/mistake_sentence.dart';

void addSentence(Sentence sentence, List sentences) {
  sentences.add(MistakeSentence(
    label: sentence.label,
    text: sentence.text,
    suggestion: sentence.suggestion,
    error: sentence.error,
  ));
}
