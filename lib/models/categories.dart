class Categories {
  static List<String> storedCategories = [];

  static void addCategory(String cat) {
    storedCategories.add(cat);
  }

  static const List<Map<String, dynamic>> categories = [
    {
      'category': 'Primary School',
      'further': [
        'Grade VIII or below',
        'Grade VII',
        'Grade VI',
        'Grade V',
        'Grade IV',
        'Others',
      ],
    },
    {
      'category': 'High School',
      'further': [
        'Form One',
        'Form Two',
        'Form Three',
        'Form Four',
      ],
    },
    {
      'category': 'University',
      'further': [
        'Engineering',
        'Science',
        'Humanities',
        'Commerce',
        'Management',
        'Law',
        'Others'
      ],
    },
    {
      'category': 'Novels',
      'further': [
        'Crime',
        'Action',
        'Thriller',
        'Romantic',
        'Fantasy',
        'Sci-Fi',
        'Documentary',
        'Others'
      ],
    },
    {
      'category': 'Reference',
      'further': [
        'Scientific',
        'Psychology',
      ],
    },
    {
      'category': 'Others',
      'further': [
        'Religious',
        'Spiritual',
        'Kids',
      ],
    },
  ];
}
