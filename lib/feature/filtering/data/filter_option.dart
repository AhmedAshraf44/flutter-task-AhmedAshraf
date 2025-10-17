class FilterOption {
  final String title;
  final List<String> values;
  String? selectedValue;

  FilterOption({required this.title, required this.values, this.selectedValue});

  static List<FilterOption> options = [
    FilterOption(
      title: 'النوع',
      values: ['الكل', 'توين هاوس', 'فيلا منفصلة', 'تاون هاوس'],
      selectedValue: 'الكل',
    ),
    FilterOption(
      title: 'عدد الغرف',
      values: ['الكل', 'غرفتين', '3 غرف', '4 غرف', '5 غرف+'],
      selectedValue: 'الكل',
    ),
    FilterOption(
      title: 'طريقة الدفع',
      values: ['أي', 'كاش', 'تقسيط'],
      selectedValue: 'أي',
    ),
    FilterOption(
      title: 'حالة العقار',
      values: ['أي', 'جاهز', 'قيد الإنشاء'],
      selectedValue: 'أي',
    ),
  ];
}
