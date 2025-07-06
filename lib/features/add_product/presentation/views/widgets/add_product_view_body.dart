import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'image_field.dart';
import 'is_featured_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productNumberController =
      TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _productSizeController = TextEditingController();
  final TextEditingController _productColorController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
                hintText: 'اسم المنتج',
                textInputType: TextInputType.text,
                controller: _productNameController,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'سعر المنتج',
                textInputType: TextInputType.number,
                controller: _productNumberController,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'كود المنتج',
                textInputType: TextInputType.text,
                controller: _productCodeController,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'مقاس المنتج',
                textInputType: TextInputType.number,
                controller: _productSizeController,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'لون المنتج',
                textInputType: TextInputType.text,
                controller: _productColorController,
              ),
              SizedBox(height: 16),


              IsFeaturedCheckBox(onChange: (value) {}),
              SizedBox(height: 16),
              ImageField(onFileChanged: (image) {}),
            ],
          ),
        ),
      ),
    );
  }
}
