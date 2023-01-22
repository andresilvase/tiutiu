import 'package:tiutiu/features/admob/constants/admob_block_names.dart';
import 'package:tiutiu/core/widgets/default_basic_app_bar.dart';
import 'package:tiutiu/features/admob/widgets/ad_banner.dart';
import 'package:tiutiu/core/utils/routes/routes_name.dart';
import 'package:tiutiu/core/widgets/custom_list_tile.dart';
import 'package:tiutiu/core/controllers/controllers.dart';
import 'package:tiutiu/core/widgets/one_line_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatDoYouWannaDo extends StatelessWidget {
  const WhatDoYouWannaDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultBasicAppBar(text: 'Formulário de adoção'),
      body: Card(
        child: ListView(
          children: [
            AdBanner(
              adId: systemController.getAdMobBlockID(
                blockName: AdMobBlockName.homeFooterAdBlockId,
                type: AdMobType.banner,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OneLineText(text: 'O que você quer fazer?'),
            ),
            _myForm(),
            Divider(),
            CustomListTile(
              text: 'Gerar e compartilhar um formulário vazio (Texto)',
              icon: Icons.file_open_outlined,
              onTap: () async {
                await adoptionFormController.shareEmptyFormText();
              },
            ),
            CustomListTile(
              text: 'Gerar e compartilhar um formulário vazio (PDF)',
              icon: Icons.picture_as_pdf_outlined,
              onTap: () async {
                await adoptionFormController.shareEmptyFormPDF();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _myForm() {
    return FutureBuilder(
      future: adoptionFormController.formExists(),
      builder: (context, snapshot) {
        return Visibility(
          visible: snapshot.data ?? true,
          child: Column(
            children: [
              CustomListTile(
                text: 'Compartilhar meu formulário (Texto)',
                icon: Icons.text_snippet_outlined,
                onTap: () async {
                  await adoptionFormController.shareFormText();
                },
              ),
              CustomListTile(
                text: 'Compartilhar meu formulário (PDF)',
                icon: Icons.share,
                onTap: () async {
                  await adoptionFormController.shareFormPDF();
                },
              ),
              Divider(),
              CustomListTile(
                text: 'Editar meu formulário',
                icon: Icons.edit_outlined,
                onTap: () async {
                  await adoptionFormController.loadForm();
                  Get.toNamed(Routes.adoptionForm);
                },
              ),
            ],
          ),
          replacement: CustomListTile(
            text: 'Preencher formulário de adoção',
            icon: Icons.edit_note_outlined,
            onTap: () {
              Get.toNamed(Routes.adoptionForm);
            },
          ),
        );
      },
    );
  }
}
