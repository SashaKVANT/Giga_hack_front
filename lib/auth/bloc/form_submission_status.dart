abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmittionSuccess extends FormSubmissionStatus {}

class SubmittionFailed extends FormSubmissionStatus {
  final Exception exception;

  SubmittionFailed(this.exception);
}
