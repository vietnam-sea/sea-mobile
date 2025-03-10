class GraphQLQueryBuilder {
  static String query(String name,
      {List<String>? fields, Map<String, dynamic>? variables}) {
    String fieldsString = fields?.join(" ") ?? "";
    return """
      query {
        $name {
          $fieldsString
        }
      }
    """;
  }

  static String mutation(
      String name, Map<String, dynamic> variables, List<String> fields) {
    String vars = variables.keys
        .map((key) => "\$$key: ${_getType(variables[key])}")
        .join(", ");
    String args = variables.keys.map((key) => "$key: \$$key").join(", ");
    String fieldsString = fields.join(" ");

    return """
      mutation ($vars) {
        $name($args) {
          $fieldsString
        }
      }
    """;
  }

  static String _getType(dynamic value) {
    if (value is int) return "Int!";
    if (value is double) return "Float!";
    if (value is bool) return "Boolean!";
    if (value is String) return "String!";
    return "ID!";
  }
}
