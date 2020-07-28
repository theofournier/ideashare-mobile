import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/post_widgets/label_checkbox.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class AddPostLabelsContent extends StatelessWidget {
  AddPostLabelsContent({this.viewModel});

  final AddPostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return buildContent(context);
  }

  Widget buildContent(BuildContext context) {
    Widget child;
    if (viewModel.isLoadingLabels) {
      child = Center(
        child: CircularProgressIndicator(),
      );
    }
    if (viewModel.labels != null && viewModel.labels.isNotEmpty) {
      child = Column(
        children: viewModel.labels
            .map((label) => Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  child: LabelCheckbox(
                    key: Key(label.id),
                    label: label,
                    selectedLabelKeys:
                        viewModel.post.labels.map((label) => label.id).toList(),
                    onTap: (label) => viewModel.setPostLabel(
                        id: label.id, title: label.title),
                  ),
                ))
            .toList(),
      );
    }
    if(child != null){
      return Container(
        margin: const EdgeInsets.only(top: 40),
        child: child,
      );
    }
    return buildUnavailable(context);
  }
  
  Widget buildUnavailable(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.asset(ImageName.addPostLabels),
          SizedBox(
            height: 40,
          ),
          Text(
            S.of(context).addPostLabelsUnavailable,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
