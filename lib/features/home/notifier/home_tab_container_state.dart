// ignore_for_file: must_be_immutable

part of 'home_tab_container_notifier.dart';

/// Represents the state of HomeTabContainer in the application.
class HomeTabContainerState extends Equatable {
  HomeTabContainerState({
    this.selectedDropDownValue,
    this.homeTabContainerModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  HomeTabContainerModel? homeTabContainerModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        homeTabContainerModelObj,
      ];

  HomeTabContainerState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    HomeTabContainerModel? homeTabContainerModelObj,
  }) {
    return HomeTabContainerState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      homeTabContainerModelObj:
          homeTabContainerModelObj ?? this.homeTabContainerModelObj,
    );
  }
}
