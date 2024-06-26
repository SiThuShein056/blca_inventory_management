import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management_with_sql/cateogry/controller/category_list_bloc.dart';
import 'package:inventory_management_with_sql/core/bloc/sqlite_read_state.dart';
import 'package:inventory_management_with_sql/product/controller/product_list_bloc.dart';
import 'package:inventory_management_with_sql/repo/product_repo/v2/product_entity.dart';
import 'package:inventory_management_with_sql/routes/route_name.dart';
import 'package:inventory_management_with_sql/widgest/button/bloc_outlined_button.dart';
import 'package:starlight_utils/starlight_utils.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Product"),
        actions: [
          CustomOutlinedButton(
            onPressed: () {
              StarlightUtils.pushNamed(
                createNewProduct,
                arguments: context.read<CategoryListBloc>(),
              );
            },
            label: "Create Product",
            icon: Icons.save_outlined,
          )
        ],
      ),
      body: BlocBuilder<ProductListBloc, SqliteReadState<Product>>(
          builder: (_, state) {
        return ListView.builder(
          itemCount: state.list.length,
          itemBuilder: (_, i) {
            return ListTile(
              title: Text(state.list[i].name),
            );
          },
        );
      }),
    );
  }
}
