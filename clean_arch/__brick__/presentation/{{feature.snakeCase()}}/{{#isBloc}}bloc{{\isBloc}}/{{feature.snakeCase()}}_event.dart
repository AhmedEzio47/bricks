
sealed class {{feature.pascalCase()}}Event {
  const {{feature.pascalCase()}}Event();
}

/// It's recommended to rename these events to use the convention of bloc events (ex: PostCreated)
{{#operations}}
final class {{..pascalCase()}}{{feature.pascalCase()}}Event extends {{feature.pascalCase()}}Event {
  const {{..pascalCase()}}{{feature.pascalCase()}}Event();
}
{{/operations}}
