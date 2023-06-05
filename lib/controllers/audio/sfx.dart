List<String> getSfxNames(SfxType type) {
  switch (type) {
    case SfxType.buttonClick:
      return [
        "button_click_1.mp3",
        "button_click_2.mp3",
      ];
    case SfxType.subPageIn:
      return [];
    case SfxType.subPageOut:
      return [];
  }
}

enum SfxType { buttonClick, subPageIn, subPageOut }
