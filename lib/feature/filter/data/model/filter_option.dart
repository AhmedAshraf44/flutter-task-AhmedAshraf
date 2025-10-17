import 'dart:convert';

class FilterOption {
  final int? id;
  final String title;
  final List<String> values;
  String? selectedValue;

  FilterOption({
    this.id,
    required this.title,
    required this.values,
    this.selectedValue,
  });

  Map<String, dynamic> toMap() {
    //  log('toMap -- $id, $title, $values, $selectedValue');
    return {
      'id': id,
      'title': title,
      'filter_values ': jsonEncode(values),
      'selectedValue': selectedValue,
    };
  }

  factory FilterOption.fromMap(Map<String, dynamic> map) {
    // log(
    //   'fromMap -- $map[id] $map[title] $map[filter_values] $map[selectedValue]',
    // );
    return FilterOption(
      id: map['id'] as int?,
      title: map['title'] as String,
      values: List<String>.from(jsonDecode(map['filter_values'] as String)),
      selectedValue: map['selectedValue'] as String?,
    );
  }

  static List<FilterOption> filterList = [
    FilterOption(
      title: 'النوع',
      values: ['الكل', 'توين هاوس', 'فيلا منفصلة', 'تاون هاوس'],
      selectedValue: 'الكل',
    ),
    FilterOption(
      title: 'عدد الغرف',
      values: ['4 غرف', '5 غرف+', 'الكل', 'غرفتين', '3 غرف'],
      selectedValue: 'الكل',
    ),
    FilterOption(
      title: 'طريقة الدفع',
      values: ['أي', 'كاش', 'تقسيط'],
      selectedValue: 'أي',
    ),
    FilterOption(
      title: 'حالة العقار',
      values: ['أي', 'جاهز', 'قيد الأنشاء'],
      selectedValue: 'أي',
    ),
  ];
}
