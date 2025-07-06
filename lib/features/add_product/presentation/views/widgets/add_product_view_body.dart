import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../domain/entities/add_product_input_entity.dart';
import 'image_field.dart';
import 'is_featured_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  // final TextEditingController _productNameController = TextEditingController();
  // final TextEditingController _productNumberController =
  //     TextEditingController();
  // final TextEditingController _productCodeController = TextEditingController();
  // final TextEditingController _productSizeController = TextEditingController();
  // final TextEditingController _productColorController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, size, color;
  late num price;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'اسم المنتج',
                textInputType: TextInputType.text,
                // controller: _productNameController,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: 'سعر المنتج',
                textInputType: TextInputType.number,
                // controller: _productNumberController,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'كود المنتج',
                textInputType: TextInputType.text,
                // controller: _productCodeController,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  size = value!;
                },
                hintText: 'مقاس المنتج',
                textInputType: TextInputType.text,
                // controller: _productSizeController,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  color = value!;
                },
                hintText: 'لون المنتج',
                textInputType: TextInputType.text,
                // controller: _productColorController,
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChange: (value) {
                  isFeatured = value;
                },
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                text: 'إضافة منتج',
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AddProductInputEntity input = AddProductInputEntity(
                        name: name,
                        code: code,
                        size: size,
                        color: color,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('يرجى اختيار صورة للمنتج')));
  }
}
