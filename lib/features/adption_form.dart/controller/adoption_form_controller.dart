import 'package:tiutiu/core/constants/assets_path.dart';
import 'package:tiutiu/features/adption_form.dart/repository/adoption_form_repository.dart';
import 'package:tiutiu/features/adption_form.dart/model/adoption_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiutiu/core/utils/routes/routes_name.dart';
import 'package:tiutiu/core/constants/strings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:get/get.dart';
import 'dart:io';

const int _STEPS_QTY = 5;

class AdoptionFormController extends GetxController {
  AdoptionFormController({required AdoptionFormRepository adoptionFormRepository})
      : _adoptionFormRepository = adoptionFormRepository;

  final AdoptionFormRepository _adoptionFormRepository;

  final Rx<AdoptionForm> _adoptionForm = AdoptionForm().obs;
  final RxBool _isEditing = false.obs;
  final RxBool _isLoading = false.obs;
  final RxInt _formStep = 0.obs;

  AdoptionForm get adoptionForm => _adoptionForm.value;
  bool get isEditing => _isEditing.value;
  bool get isLoading => _isLoading.value;
  int get formStep => _formStep.value;

  void setLoading(bool loadingValue, {String loadingText = ''}) {
    _isLoading(loadingValue);
  }

  void nextStep() {
    if (formStep < _STEPS_QTY) {
      _formStep(formStep + 1);
    }
  }

  void previousStep() {
    if (formStep > 0) {
      _formStep(formStep - 1);
    } else if (formStep == 0) {
      Get.back();
    }
  }

  void setAdoptionForm(AdoptionForm adoptionForm) {
    _adoptionForm(adoptionForm);

    print('New Form ${adoptionForm.toMap()}');
  }

  bool lastStep() => _formStep == _STEPS_QTY;

  Future<void> saveForm() async {
    setLoading(true);
    await _adoptionFormRepository.saveForm(adoptionForm: adoptionForm);
    await Future.delayed(Duration(seconds: 1));
    setLoading(false);
  }

  void resetForm() {
    _adoptionForm(AdoptionForm());
    _formStep(0);
    _isEditing(false);
  }

  Future<bool> formExists() async {
    final form = await _adoptionFormRepository.getForm();
    return form != null;
  }

  Future<void> loadForm() async {
    final form = await _adoptionFormRepository.getForm();
    _adoptionForm(form);
    _isEditing(true);
  }

  Future<void> shareFormText() async {
    await loadForm();
    await Share.share(adoptionForm.toString());
    Get.offNamedUntil(Routes.home, (route) => route.settings.name == Routes.home);
    resetForm();
  }

  Future<void> shareEmptyFormText() async {
    await Share.share(adoptionForm.toStringEmpty());
    Get.offNamedUntil(Routes.home, (route) => route.settings.name == Routes.home);
  }

  Future<void> shareFormPDF() async {
    await loadForm();
    await _generateFormPDF(part1: adoptionForm.toPDFPart1(), part2: adoptionForm.toPDFPart2());
    resetForm();
    Get.offNamedUntil(Routes.home, (route) => route.settings.name == Routes.home);
  }

  Future<void> shareEmptyFormPDF() async {
    await _generateFormPDF(
      part1: adoptionForm.toPDFPart1Empty(),
      part2: adoptionForm.toPDFPart2Empty(),
      isEmptyForm: true,
    );
  }

  Future<void> _generateFormPDF({required String part1, required String part2, bool isEmptyForm = false}) async {
    final pdf = pw.Document();

    final image = pw.MemoryImage(
      (await rootBundle.load(ImageAssets.pdfWaterMark)).buffer.asUint8List(),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Transform.scale(
            scale: 1.1,
            child: pw.Stack(
              children: [
                pw.Positioned(
                  bottom: Get.height * (isEmptyForm ? .80 : .65),
                  right: 0,
                  child: pw.Opacity(
                    opacity: .5,
                    child: pw.Container(
                      height: 48.0.h,
                      width: 48.0.h,
                      child: pw.Image(
                        image,
                        fit: pw.BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                pw.Text(part1),
              ],
            ),
          );
        },
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Transform.scale(
            scale: 1.1,
            child: pw.Stack(
              children: [
                pw.Positioned(
                  bottom: Get.width / (isEmptyForm ? 1.6 : 1.75),
                  right: isEmptyForm ? 136.0.w : 32.0.w,
                  child: pw.Opacity(
                    opacity: .5,
                    child: pw.Container(
                      height: 48.0.h,
                      width: 48.0.h,
                      child: pw.Image(
                        image,
                        fit: pw.BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                pw.Text(part2),
              ],
            ),
          );
        },
      ),
    );

    String dir = (await getTemporaryDirectory()).path;

    File pdfFile = File('$dir/${AdoptionFormStrings.formPdfName}${isEmptyForm ? ' (Vazio)' : ''}.pdf');

    await pdfFile.writeAsBytes(await pdf.save());

    await Share.shareXFiles([XFile(pdfFile.path)]);
  }

  final List<String> formStepsTitle = [
    AdoptionFormStrings.personalInfo,
    AdoptionFormStrings.referenceContacts,
    AdoptionFormStrings.petInfo,
    AdoptionFormStrings.houseInfo,
    AdoptionFormStrings.financialInfo,
    AdoptionFormStrings.backgroundInfo,
  ];

  final List<String> maritalStatus = [
    '-',
    MaritalStatusStrings.marriedSeparated,
    MaritalStatusStrings.stableUnion,
    MaritalStatusStrings.divorced,
    MaritalStatusStrings.separated,
    MaritalStatusStrings.single,
    MaritalStatusStrings.married,
    MaritalStatusStrings.widower,
  ];

  final List<String> petsType = [
    '-',
    PetTypeStrings.dog,
    PetTypeStrings.cat,
    PetTypeStrings.bird,
  ];
}
