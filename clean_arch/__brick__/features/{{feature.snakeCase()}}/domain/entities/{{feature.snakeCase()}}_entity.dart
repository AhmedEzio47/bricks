class {{feature.pascalCase()}}Entity {
    const {{feature.pascalCase()}}Entity ({
        {{#properties}} this.{{name.camelCase()}},
        {{/properties}}
    });

    {{#properties}}final {{{type}}}? {{name.camelCase()}};
    {{/properties}}
}
