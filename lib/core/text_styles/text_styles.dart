
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class TextStyles{

TextStyle regular(double fontSize, Color color){
  return GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: fontSize,
        color: color),
  );
}


TextStyle bold(double fontSize, Color color){
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color),
  );
}

TextStyle black(double fontSize, Color color){
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontWeight: FontWeight.w900,
        fontSize: fontSize,
        color: color),
  );
}

}

class Regular extends TextStyle{

  Widget regularHeader(int id, String text, Color color){
     switch(id){
       case 1:
          return Text(text, style: TextStyles().regular(48.8, color),);
       case 2:
         return Text(text, style: TextStyles().regular(39.1, color),);
       case 3:
         return Text(text, style: TextStyles().regular(31.3, color),);
       case 4:
         return Text(text, style: TextStyles().regular(25, color),);
       case 5:
         return Text(text, style: TextStyles().regular(20, color),);
       default:
         return const SizedBox();
     }
  }

  Widget regularParagraph(String id, String text, Color color){
    switch(id){
      case 'L' || 'l':
        return Text(text, style: TextStyles().regular(16, color),);
      case 'S' || 's':
        return Text(text, style: TextStyles().regular(12.8, color),);
      case "xs" || "XS" || "Xs" || "xS":
        return Text(text, style: TextStyles().regular(10.2, color),);
      default:
        return const SizedBox();
    }
  }
}


class Bold extends TextStyle{

  Widget boldHeader(int id, String text, Color color){
    switch(id){
      case 1:
        return Text(text, style: TextStyles().bold(48.8, color),);
      case 2:
        return Text(text, style: TextStyles().bold(39.1, color),);
      case 3:
        return Text(text, style: TextStyles().bold(31.3, color),);
      case 4:
        return Text(text, style: TextStyles().bold(25, color),);
      case 5:
        return Text(text, style: TextStyles().bold(20, color),);
      default:
        return const SizedBox();
    }
  }

  Widget boldParagraph(String id, String text, Color color){
    switch(id){
      case 'L' || 'l':
        return Text(text, style: TextStyles().bold(16, color),);
      case 'S' || 's':
        return Text(text, style: TextStyles().bold(12.8, color),);
      case "xs" || "XS" || "Xs" || "xS":
        return Text(text, style: TextStyles().bold(10.2, color),);
      default:
        return const SizedBox();
    }
  }
}


class Black extends TextStyle{

  Widget blackHeader(int id, String text, Color color){
    switch(id){
      case 1:
        return Text(text, style: TextStyles().black(48.8, color),);
      case 2:
        return Text(text, style: TextStyles().black(39.1, color),);
      case 3:
        return Text(text, style: TextStyles().black(31.3, color),);
      case 4:
        return Text(text, style: TextStyles().black(25, color),);
      case 5:
        return Text(text, style: TextStyles().black(20, color),);
      default:
        return const SizedBox();
    }
  }

  Widget blackParagraph(String id, String text, Color color){
    switch(id){
      case 'L' || 'l':
        return Text(text, style: TextStyles().black(16, color),);
      case 'S' || 's':
        return Text(text, style: TextStyles().black(12.8, color),);
      case "xs" || "XS" || "Xs" || "xS":
        return Text(text, style: TextStyles().black(10.2, color),);
      default:
        return const SizedBox();
    }
  }
}
