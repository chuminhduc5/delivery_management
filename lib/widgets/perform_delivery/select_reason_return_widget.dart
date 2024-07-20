import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/reason_return.dart';
import '../../styles/theme.dart';
import '../../blocs/reason_return_bloc/reason_return_bloc.dart';

class SelectReasonReturnWidget extends StatefulWidget {
  const SelectReasonReturnWidget({super.key});

  @override
  State<SelectReasonReturnWidget> createState() => _SelectReasonReturnWidgetState();
}

class _SelectReasonReturnWidgetState extends State<SelectReasonReturnWidget> {
  List<ReasonReturn> items = [];
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    context.read<ReasonReturnBloc>().add(FetchReasonReturn());
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReasonReturnBloc, ReasonReturnState>(
      builder: (context, state) {
        if (state is ReasonReturnLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ReasonReturnSuccess) {
          items = state.items;
          // Xóa các giá trị trùng lặp
          final removeDuplicateValues = items
              .map((item) => item.description)
              .toSet()
              .toList();

          return DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: const Text(
                'Lý do khách trả lại hàng',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              items: removeDuplicateValues
                  .map((description) => DropdownMenuItem<String>(
                value: description,
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              buttonStyleData: ButtonStyleData(
                height: 45,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.bgAppbar,
                  ),
                  color: Colors.white,
                ),
                elevation: 10,
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                iconSize: 14,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 180,
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                offset: const Offset(0, -10),

              ),
              menuItemStyleData: MenuItemStyleData(
                height: 30,
                overlayColor: WidgetStateProperty.all(AppColors.greenWithOpacity),
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: textEditingController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Tìm kiếm',
                      hintStyle: const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value.toString().contains(searchValue);
                },
              ),
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  textEditingController.clear();
                }
              },
            ),
          );
        } else if (state is ReasonReturnFailed) {
          return Center(child: Text('Failed to load data: ${state.message}'));
        } else {
          return Center(child: Text('No data available'));
        }
      },
    );
  }
}
