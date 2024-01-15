// ignore_for_file: must_be_immutable

import 'package:assignment/features/home/models/selection_popup_model.dart';
import 'package:equatable/equatable.dart';

import 'incomecomponent_item_model.dart';

/// This class defines the variables used in the [home_tab_container_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeTabContainerModel extends Equatable {
  HomeTabContainerModel({
    this.dropdownItemList = const [],
    this.incomeComponentItemList = const [],
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<IncomeComponentItemModel> incomeComponentItemList;

  HomeTabContainerModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<IncomeComponentItemModel>? incomeComponentItemList,
  }) {
    return HomeTabContainerModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      incomeComponentItemList:
          incomeComponentItemList ?? this.incomeComponentItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList, incomeComponentItemList];
}
