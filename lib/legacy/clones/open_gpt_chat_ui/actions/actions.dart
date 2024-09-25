class Action {
  const Action({required this.name});

  final String name;
}

class CreateChatAction extends Action {
  const CreateChatAction() : super(name: 'create_chat');
}

class OpenUpgradeInfo extends Action {
  const OpenUpgradeInfo() : super(name: 'open_upgrade_info');
}

class OpenSharePreview extends Action {
  const OpenSharePreview() : super(name: 'open_share_preview');
}

class SendMessage extends Action {
  const SendMessage() : super(name: 'send_message');
}
