import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  CampoWidget(
      {@required this.campo,
      @required this.onAbrir,
      @required this.onAlternarMarcacao});

  Widget _getImage() {
    int qtdeMinas = campo.qtdeMinasNaVizinhanca;
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba0.jpg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba1.jpg');
    } else if (campo.aberto && campo.qtdeMinasNaVizinhanca > 0) {
      return Image.asset('assets/images/assets$qtdeMinas.jpg');
    } else if (campo.aberto) {
      return Image.asset('assets/images/assets0.jpg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/marcado.jpg');
    } else {
      return Image.asset('assets/images/fechado.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),
    );
  }
}
