import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton2 extends StatelessWidget {
  const CustomDropdownButton2({
    super.key,
    required this.hint,
    this.title,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.searchController,
    this.enableSearch = false,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
  });

  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;

  final bool enableSearch;
  final TextEditingController? searchController;

  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
   final Widget? title;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
 if (title != null) title!,
          // if (title != null)
          //   Text(
          //     title ?? "",
          //     style: TextStyle(
          //       color: showError ? const Color(0xff2B338C) : const Color(0xFF6C7278),
          //       fontSize: 12,
          //       fontFamily: "Plus Jakarta Sans",
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          if (title != null) const SizedBox(height: 6),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Container(
              alignment: hintAlignment,
              child: Text(
                hint,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            value: value,
            items: dropdownItems
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Container(
                        alignment: valueAlignment,
                        child: Text(
                          item,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ))
                .toList(),
            onChanged: onChanged,
            selectedItemBuilder: selectedItemBuilder,
            buttonStyleData: ButtonStyleData(
              height: buttonHeight ?? 40,
              width: buttonWidth ?? 140,
              padding: buttonPadding ?? const EdgeInsets.symmetric(horizontal: 14),
              decoration: buttonDecoration ??
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.black45),
                  ),
              elevation: buttonElevation,

            ),
            
            iconStyleData: IconStyleData(
              icon: icon ?? const Icon(Icons.arrow_drop_down),
              iconSize: iconSize ?? 24,
              iconEnabledColor: iconEnabledColor,
              iconDisabledColor: iconDisabledColor,
            ),
            dropdownStyleData: DropdownStyleData(
         
              
              maxHeight: dropdownHeight ?? 300,
              width: dropdownWidth ?? 140,
              padding: dropdownPadding,
              decoration: dropdownDecoration ??
                  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
              elevation: dropdownElevation ?? 8,
              offset: offset,
              scrollbarTheme: ScrollbarThemeData(
                radius: scrollbarRadius ?? const Radius.circular(40),
                thickness: scrollbarThickness != null
                    ? MaterialStateProperty.all<double>(scrollbarThickness!)
                    : null,
                thumbVisibility: scrollbarAlwaysShow != null
                    ? MaterialStateProperty.all<bool>(scrollbarAlwaysShow!)
                    : null,
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: itemHeight ?? 48,
 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
           //   padding: itemPadding ?? const EdgeInsets.symmetric(horizontal: 14),
            ),
            dropdownSearchData: enableSearch
                ? DropdownSearchData(
                    searchController: searchController,
                  
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        controller: searchController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          hintText: 'Search...',
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return item.value
                          .toString()
                          .toLowerCase()
                          .contains(searchValue.toLowerCase());
                    },
                  )
                : null,
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                searchController?.clear();
              }
            },
          ),
        ),
      ],
    );
  }
}
