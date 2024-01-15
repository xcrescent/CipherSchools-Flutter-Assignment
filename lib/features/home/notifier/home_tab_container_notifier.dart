import 'dart:ui';

import 'package:assignment/features/home/models/home_tab_container_model.dart';
import 'package:assignment/features/home/models/selection_popup_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/incomecomponent_item_model.dart';

part 'home_tab_container_state.dart';

final homeTabContainerNotifier =
    StateNotifierProvider<HomeTabContainerNotifier, HomeTabContainerState>(
  (ref) => HomeTabContainerNotifier(
    HomeTabContainerState(
      selectedDropDownValue: SelectionPopupModel(title: ''),
      homeTabContainerModelObj: HomeTabContainerModel(
        dropdownItemList: [
          SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
          SelectionPopupModel(id: 2, title: "Item Two"),
          SelectionPopupModel(id: 3, title: "Item Three")
        ],
        incomeComponentItemList: [
          IncomeComponentItemModel(
            userImage: "assets/images/img_user.svg",
            incomeText: "Income",
            amountText: "₹50000",
            color: const Color(0xff00A86B),
          ),
          IncomeComponentItemModel(
            userImage: "assets/images/img_user_red_500.svg",
            incomeText: "Expenses",
            amountText: "₹12000",
            color: const Color(0xffFD3C4A),
          )
        ],
      ),
    ),
  ),
);

/// A notifier that manages the state of a HomeTabContainer according to the event that is dispatched to it.
class HomeTabContainerNotifier extends StateNotifier<HomeTabContainerState> {
  HomeTabContainerNotifier(HomeTabContainerState state) : super(state);

  void onSelected(value) {
    state = state.copyWith(
      selectedDropDownValue: value,
    );
  }
}
