class AppModel {
  const AppModel({
    this.isPublished,
    this.id,
    this.hash,
    this.vanityPath,
    this.appTitle,
    this.description,
    this.colorBackground,
    this.colorText,
    this.colorButton,
    this.logoUrl,
    this.theme,
    this.formFields,
    this.flow,
    this.aiModels,
    this.creditsRequired,
    this.isOfficialTemplate,
    this.isCommunityTemplate,
    this.isFreeTemplate,
    this.hostCredits,
    this.dailyUsageCount,
    this.numRun,
    this.numCloned,
    this.clonedFrom,
    this.createdDate,
    this.updatedDate,
    this.deletedDate,
    this.createdBy,
    this.categories,
  });

  final bool? isPublished;
  final int? id;
  final String? hash;
  final dynamic vanityPath;
  final String? appTitle;
  final String? description;
  final String? colorBackground;
  final String? colorText;
  final String? colorButton;
  final dynamic logoUrl;
  final String? theme;
  final List<FormField>? formFields;
  final List<Flow>? flow;
  final List<String>? aiModels;
  final int? creditsRequired;
  final bool? isOfficialTemplate;
  final bool? isCommunityTemplate;
  final bool? isFreeTemplate;
  final bool? hostCredits;
  final int? dailyUsageCount;
  final int? numRun;
  final int? numCloned;
  final dynamic clonedFrom;
  final DateTime? createdDate;
  final DateTime? updatedDate;
  final dynamic deletedDate;
  final CreatedBy? createdBy;
  final List<dynamic>? categories;

  bool get hasTitle => appTitle != null;

  bool get hasDescription => description != null;

  AppModel copyWith({
    bool? isPublished,
    int? id,
    String? hash,
    dynamic vanityPath,
    String? appTitle,
    String? description,
    String? colorBackground,
    String? colorText,
    String? colorButton,
    dynamic logoUrl,
    String? theme,
    List<FormField>? formFields,
    List<Flow>? flow,
    List<String>? aiModels,
    int? creditsRequired,
    bool? isOfficialTemplate,
    bool? isCommunityTemplate,
    bool? isFreeTemplate,
    bool? hostCredits,
    int? dailyUsageCount,
    int? numRun,
    int? numCloned,
    dynamic clonedFrom,
    DateTime? createdDate,
    DateTime? updatedDate,
    dynamic deletedDate,
    CreatedBy? createdBy,
    List<dynamic>? categories,
  }) =>
      AppModel(
        isPublished: isPublished ?? this.isPublished,
        id: id ?? this.id,
        hash: hash ?? this.hash,
        vanityPath: vanityPath ?? this.vanityPath,
        appTitle: appTitle ?? this.appTitle,
        description: description ?? this.description,
        colorBackground: colorBackground ?? this.colorBackground,
        colorText: colorText ?? this.colorText,
        colorButton: colorButton ?? this.colorButton,
        logoUrl: logoUrl ?? this.logoUrl,
        theme: theme ?? this.theme,
        formFields: formFields ?? this.formFields,
        flow: flow ?? this.flow,
        aiModels: aiModels ?? this.aiModels,
        creditsRequired: creditsRequired ?? this.creditsRequired,
        isOfficialTemplate: isOfficialTemplate ?? this.isOfficialTemplate,
        isCommunityTemplate: isCommunityTemplate ?? this.isCommunityTemplate,
        isFreeTemplate: isFreeTemplate ?? this.isFreeTemplate,
        hostCredits: hostCredits ?? this.hostCredits,
        dailyUsageCount: dailyUsageCount ?? this.dailyUsageCount,
        numRun: numRun ?? this.numRun,
        numCloned: numCloned ?? this.numCloned,
        clonedFrom: clonedFrom ?? this.clonedFrom,
        createdDate: createdDate ?? this.createdDate,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedDate: deletedDate ?? this.deletedDate,
        createdBy: createdBy ?? this.createdBy,
        categories: categories ?? this.categories,
      );
}

class CreatedBy {
  CreatedBy({
    this.id,
    this.hash,
    this.auth0Id,
    this.email,
    this.credits,
    this.creditsUsed,
    this.avatar,
    this.displayName,
    this.givenName,
    this.familyName,
    this.bio,
    this.website,
    this.twitter,
    this.youtube,
    this.instagram,
    this.linkedin,
    this.tiktok,
    this.facebook,
    this.plan,
    this.stripeCustomerId,
    this.showBrancherBranding,
    this.showShareOptions,
    this.showCreatorLinks,
    this.logo,
    this.colorBackground,
    this.colorText,
    this.colorButton,
    this.isAdmin,
    this.createdDate,
    this.updatedDate,
    this.deletedDate,
  });

  final int? id;
  final String? hash;
  final String? auth0Id;
  final String? email;
  final int? credits;
  final int? creditsUsed;
  final String? avatar;
  final String? displayName;
  final String? givenName;
  final String? familyName;
  final String? bio;
  final String? website;
  final String? twitter;
  final String? youtube;
  final String? instagram;
  final String? linkedin;
  final String? tiktok;
  final String? facebook;
  final String? plan;
  final dynamic stripeCustomerId;
  final bool? showBrancherBranding;
  final bool? showShareOptions;
  final bool? showCreatorLinks;
  final String? logo;
  final String? colorBackground;
  final String? colorText;
  final String? colorButton;
  final bool? isAdmin;
  final DateTime? createdDate;
  final DateTime? updatedDate;
  final dynamic deletedDate;

  CreatedBy copyWith({
    int? id,
    String? hash,
    String? auth0Id,
    String? email,
    int? credits,
    int? creditsUsed,
    String? avatar,
    String? displayName,
    String? givenName,
    String? familyName,
    String? bio,
    String? website,
    String? twitter,
    String? youtube,
    String? instagram,
    String? linkedin,
    String? tiktok,
    String? facebook,
    String? plan,
    dynamic stripeCustomerId,
    bool? showBrancherBranding,
    bool? showShareOptions,
    bool? showCreatorLinks,
    String? logo,
    String? colorBackground,
    String? colorText,
    String? colorButton,
    bool? isAdmin,
    DateTime? createdDate,
    DateTime? updatedDate,
    dynamic deletedDate,
  }) =>
      CreatedBy(
        id: id ?? this.id,
        hash: hash ?? this.hash,
        auth0Id: auth0Id ?? this.auth0Id,
        email: email ?? this.email,
        credits: credits ?? this.credits,
        creditsUsed: creditsUsed ?? this.creditsUsed,
        avatar: avatar ?? this.avatar,
        displayName: displayName ?? this.displayName,
        givenName: givenName ?? this.givenName,
        familyName: familyName ?? this.familyName,
        bio: bio ?? this.bio,
        website: website ?? this.website,
        twitter: twitter ?? this.twitter,
        youtube: youtube ?? this.youtube,
        instagram: instagram ?? this.instagram,
        linkedin: linkedin ?? this.linkedin,
        tiktok: tiktok ?? this.tiktok,
        facebook: facebook ?? this.facebook,
        plan: plan ?? this.plan,
        stripeCustomerId: stripeCustomerId ?? this.stripeCustomerId,
        showBrancherBranding: showBrancherBranding ?? this.showBrancherBranding,
        showShareOptions: showShareOptions ?? this.showShareOptions,
        showCreatorLinks: showCreatorLinks ?? this.showCreatorLinks,
        logo: logo ?? this.logo,
        colorBackground: colorBackground ?? this.colorBackground,
        colorText: colorText ?? this.colorText,
        colorButton: colorButton ?? this.colorButton,
        isAdmin: isAdmin ?? this.isAdmin,
        createdDate: createdDate ?? this.createdDate,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedDate: deletedDate ?? this.deletedDate,
      );
}

class Flow {
  Flow({
    this.id,
    this.type,
    this.properties,
  });

  final String? id;
  final String? type;
  final FlowProperties? properties;

  Flow copyWith({
    String? id,
    String? type,
    FlowProperties? properties,
  }) =>
      Flow(
        id: id ?? this.id,
        type: type ?? this.type,
        properties: properties ?? this.properties,
      );
}

class FlowProperties {
  FlowProperties({
    this.outputVisible,
    this.prompt,
    this.negativePrompt,
  });

  final bool? outputVisible;
  final List<Prompt>? prompt;
  final List<NegativePrompt>? negativePrompt;

  FlowProperties copyWith({
    bool? outputVisible,
    List<Prompt>? prompt,
    List<NegativePrompt>? negativePrompt,
  }) =>
      FlowProperties(
        outputVisible: outputVisible ?? this.outputVisible,
        prompt: prompt ?? this.prompt,
        negativePrompt: negativePrompt ?? this.negativePrompt,
      );
}

class NegativePrompt {
  NegativePrompt({
    this.type,
    this.children,
  });

  final String? type;
  final List<NegativePromptChild>? children;

  NegativePrompt copyWith({
    String? type,
    List<NegativePromptChild>? children,
  }) =>
      NegativePrompt(
        type: type ?? this.type,
        children: children ?? this.children,
      );
}

class NegativePromptChild {
  NegativePromptChild({
    this.text,
  });

  final String? text;

  NegativePromptChild copyWith({
    String? text,
  }) =>
      NegativePromptChild(
        text: text ?? this.text,
      );
}

class Prompt {
  Prompt({
    this.type,
    this.children,
  });

  final String? type;
  final List<PromptChild>? children;

  Prompt copyWith({
    String? type,
    List<PromptChild>? children,
  }) =>
      Prompt(
        type: type ?? this.type,
        children: children ?? this.children,
      );
}

class PromptChild {
  PromptChild({
    this.text,
    this.type,
    this.character,
    this.children,
  });

  final String? text;
  final String? type;
  final String? character;
  final List<NegativePromptChild>? children;

  PromptChild copyWith({
    String? text,
    String? type,
    String? character,
    List<NegativePromptChild>? children,
  }) =>
      PromptChild(
        text: text ?? this.text,
        type: type ?? this.type,
        character: character ?? this.character,
        children: children ?? this.children,
      );
}

class FormField {
  FormField({
    this.id,
    this.type,
    this.properties,
  });

  final String? id;
  final String? type;
  final FormFieldProperties? properties;

  FormField copyWith({
    String? id,
    String? type,
    FormFieldProperties? properties,
  }) =>
      FormField(
        id: id ?? this.id,
        type: type ?? this.type,
        properties: properties ?? this.properties,
      );
}

class FormFieldProperties {
  FormFieldProperties({
    this.label,
    this.placeholder,
  });

  final String? label;
  final String? placeholder;

  FormFieldProperties copyWith({
    String? label,
    String? placeholder,
  }) =>
      FormFieldProperties(
        label: label ?? this.label,
        placeholder: placeholder ?? this.placeholder,
      );
}
