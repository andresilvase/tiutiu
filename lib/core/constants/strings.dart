import 'package:tiutiu/core/constants/contact_type.dart';

class AppStrings {
  static String get crashlyticsInfo =>
      'Para melhor resolver possíveis falhas no aplicativo gostaríamos de receber relatório de falhas automaticamente.\n\nDeseja enviar relatórios de falhas automaticamente para os desenvolvedores?';
  static String get noConnectionWarning => 'Estes posts podem estar desatualizados porque você está sem internet.';
  static String get verifyEmailToSeeContactInfo => 'Verifique seu email para ver as informações de contato!';
  static String get authError => 'Ocorreu um erro com sua autenticação.\nTente sair e entrar novamente.';
  static String get unableToGenerateSharebleFile => 'Não foi possível gerar arquivo compartilhável.';
  static String get doLoginWarning => 'Faça login para ter acesso a todas as funcionalidades.';
  static String get headline2 => 'Muitos Pets Lindos\nEstão Aguardando Por Você';
  static String get verifyAccountWarning => 'Sua conta ainda não foi verificada!';
  static String get verifyFilters => 'Verifique seus filtros de busca.';
  static String get tryAgainInABrief =>
      'Postagens temporariamente indisponíveis.\nEntre novamente em alguns minutos.\n\nAgradecessemos a compreensão!';
  static String watchAnAd(ContactType contactType, bool noPreviousData) {
    if (noPreviousData) {
      if (contactType == ContactType.whatsapp) return 'Assista um vídeo para conversar via WhatsApp.';
      return 'Assista um vídeo para conversar via Chat.';
    } else {
      if (contactType == ContactType.whatsapp)
        return 'Limite de conversas via WhatsApp atingido.\n\nAssista um vídeo para renovar.';
      return 'Limite de conversas via Chat atingido.\n\nAssista um vídeo para renovar.';
    }
  }

  static const String verifyInternetConnection = 'Verifique sua conexão com a internet';

  static String get weAreGettingAllReady => 'Preparando tudo para você';
  static String get changeListVisual => 'Mude a visualização da lista';
  static String get imagesWarning => 'Imagens meramente ilustrativas';
  static String get noPostFavorited => 'Nenhum PET foi favoritado.';
  static String get backToCivilization => 'Voltar a civilização';
  static String get chatWithAnnouncer => 'Falar com anunciante';
  static String get wannaLeave => 'Deseja realmente sair?';
  static String get loadingImage => 'Carregando imagem...';
  static String get noPostFound => 'Nada foi encontrado.';
  static String get callInWhatsapp => 'Chamar no WhatsApp';
  static String get jotSomethingDown => 'Escreva aqui...';
  static String get noCallOnChat => 'Não, falar no chat';
  static String get backToStart => 'Voltar ao início';
  static String get repeatPassword => 'Repita a senha';
  static String get genericError => 'Ocorreu um erro';
  static String get loadingVideo => 'Carregando vídeo';
  static String get headline1 => 'Faça Um Novo Amigo';
  static String get takeApicture => 'Tirar uma foto';
  static String get recordVideo => 'Gravar um vídeo';
  static String get endApp => 'Encerrar aplicação';
  static String get openGallery => 'Abrir galeria';
  static const String tryAgain = 'Tentar novamente';
  static String get noConnection => 'Sem internet';
  static String get disappeared => 'Desaparecidos';
  static const String commingSoon = 'Em breve';
  static String get provideInfo => 'Informar';
  static String get views => 'visualizações';
  static String get getStarted => 'Começar';
  static String get loading => 'Carregando';
  static String get reload => 'Recarregar';
  static String get contines => 'Continuar';
  static String get success => 'Sucesso!';
  static String get infos => 'informações';
  static String get postedAt => 'Postado';
  static String get profile => 'Perfil';
  static String get cancel => 'Cancelar';
  static String get saveds => 'Salvos';
  static String get password => 'Senha';
  static String get warning => 'Aviso';
  static String get watch => 'Assistir';
  static String get name => 'Tiu, tiu';
  static String share = 'Compartilhar';
  static String get adopte => 'Adote';
  static String tiutok = 'Tiutiu Tok';
  static String get email => 'E-mail';
  static String get wait => 'Aguarde';
  static String get post => 'Postar';
  static String get back => 'Voltar';
  static String get send => 'Enviar';
  static String get save => 'Salvar';
  static String get leave => 'Sair';
  static String get more => 'Mais';
  static String get type => 'Tipo';
  static String videos = 'Videos';
  static String get yes => 'Sim';
  static String get no => 'Não';
  static String get ok => 'OK';
  static String txt = 'Texto';
  static String chat = 'Chat';
  static String pdf = 'PDF';
}

class AuthStrings {
  static const String demandRecentLoginWarning = 'Está ação requer que você faça login novamente.\n\nDeseja deslogar?';
  static String passwordShouldBeAtLeast(String field, int length) => '$field deve ter no mínimo $length dígitos';
  static const String unableToResendEmail = 'Não foi possível reenviar o e-mail. Tente novamente mais tarde!';
  static const String friendlyReminderToAdd9Digit = 'Lembre-se de acrescentar o 9 à frente do número.';
  static const String tryVerifyCodeAgain = 'Não foi possível verificar o código.\nTente novamente.';
  static const String verifyEmailAdvice = 'Somente contas verificadas podem fazer uma publicação.';
  static const String confirmeIfThisNumberIsCorrect = 'Confirme se o número está correto.';
  static const String weWilSendACodeToThisNumber = 'Vamos enviar um código para o número';
  static const String insertCodeSentToNumber = 'Insira o código enviado para o número';
  static const String linkWasSent = 'Um link de verificação foi enviado para o email';
  static const String whenContinue = 'Ao continuar, você concorda com nossos';
  static const String successfullyVerifiedCode = 'Código verificado com sucesso!';
  static const String doYouWannaPasteCodeCopied = 'Deseja colar o código copiado';
  static const String resetPasswordInstructionsSent =
      'As instruções de como resetar sua senha foi enviada para o e-mail informado.';
  static const String codeIsValidForMinutes = 'O código é valido por 2 minutos.';
  static const String deleteAccountWarning =
      'Após excluir sua conta não será possível recuperá-la.\n\nDeseja continuar?';
  static String get loginCouldNotProceed => 'Não foi possível completar o login';
  static const String checkYourSpam = 'Cheque sua caixa de spam se necessário.';
  static String get confirmAndReceiveCode => 'Confirmar e receber código';
  static const String typePasswordAgain = 'Digite a senha novamente';
  static String get editPhoneNumber => 'Editar número de telefone';
  static String get authentique => 'Autentique-se para continuar.';
  static String get privacyPolicy => 'Política de privacidade';
  static const String verifyYourNumber = 'Verifique seu número';
  static const String dontReceiveEmail = 'Não recebeu um email?';
  static const String verifyYourEmail = 'Verifique seu email';
  static String get createNewAccount => 'Crie uma nova conta.';
  static const String passwordNotMatch = 'Senhas não conferem';
  static String get doNotHaveAnAccount => 'Não tem uma conta?';
  static String get termsAndConditions => 'Termos e condições';
  static String get continueAnon => 'Continuar anônimamente';
  static const String numberVerified = 'Número verificado';
  static const String loginInProgress = 'Realizando Login';
  static const String forgotPassword = 'Esqueceu a senha?';
  static String get enterAccount => 'Entrar na sua conta.';
  static String get authFailure => 'Falha na autenticação';
  static String get haveAnAccount => 'Já tem uma conta?';
  static const String authenticanting = 'Autênticando...';
  static const String typeYourEmail = 'Digite seu email';
  static String get resetPassword => 'Resetar a senha.';
  static const String registeringUser = 'Criando conta';
  static const String invalidCode = 'Código inválido!';
  static String get facebook => 'Entrar com o Facebook';
  static const String invalidEmail = 'E-mail inválido';
  static const String deleteAccount = 'Excluir conta';
  static const String receiveEmail = 'Receber email';
  static const String emailSent = 'E-mail enviado!';
  static String get google => 'Entrar com o Google';
  static String get apple => 'Entrar com a Apple';
  static String get createAccount => 'Criar conta';
  static const String pasteCode = 'Colar código';
  static String get createYours => 'Crie a sua.';
  static String get email => 'Entrar com E-mail';
  static const String clickHere = 'Clique aqui';
  static const String doLogin = 'Faça login';
  static const String resend = 'Reenviar';
  static String get validate => 'Validar';
  static String get enter => 'Entrar';
}

class ValidatorsStrings {
  static const String invalidPhoneNumber = 'Número inválido';
  static const String requiredField = 'Campo obrigatório';
}

class HomeStrings {
  static String get searchForName => 'Digite o nome de um PET...';
}

class BottomBarStrings {
  static String get favorites => 'Favoritos';
}

class FilterStrings {
  static String get orderedBy => 'ordenados por:  ';
  static String get disappeared => 'Desaparecidos';
  static String get foundAt => 'encontrados em ';
  static String get petBreed => 'Raça do Pet';
  static String get petName => 'Nome do Pet';
  static String get distance => 'Distância';
  static String get posts => 'posts';
  static String get date => 'Data';
  static String get age => 'Idade';
  static String get name => 'Nome';
}

class PetTypeStrings {
  static const String other = 'Outro';
  static const String dog = 'Cachorro';
  static const String bird = 'Pássaro';
  static const String all = 'Todos';
  static const String cat = 'Gato';
}

class PetHealthString {
  static String get chronicDisease => 'Doença Crônica';
  static String get palliative => 'Paliativo';
  static String get preganant => 'Prenhez';
  static String get healthy => 'Saudável';
  static String get hurted => 'Machucado';
  static String get ill => 'Doente';
}

class LocalPermissionStrings {
  static String get permissionDeniedForeverWarning =>
      'Vá para a configuração de permissões no seu aparelho e permita que o Tiu, tiu acesse sua localização.\n\nAo finalizar, pode ser necessário fechar e abrir o app e abra novamente.';
  static String get needsAccess =>
      'precisa de ter acesso a sua localização para mostrar os animais mais próximos do seu local.';
  static String get needsGPS => 'precisa que o serviço de GPS / Localização esteja ativado!';
  static String get appBarTitle => 'Permissão para acessar sua localização';
  static String get turnOnLocalization => 'ATIVAR LOCALIZAÇÃO';
  static String get openSettings => 'IR P/ CONFIGURAÇÕES';
  static String get grantAcess => 'CONCEDER ACESSO';
  static String get localization => 'Localização';
}

class UserStrings {
  static String get allowContactViaWhatsApp => 'Permitir contato via WhatsApp';
  static const String completeProfile = 'Completar perfil';
  static String postsQty(int qty) => qty == 1 ? 'post' : 'posts';
  static String get userLastSeen => 'Visto por útlimo';
  static String get userSince => 'Usuário desde';
  static String get contact => 'Contato';
}

class SettingsStrings {
  static String get setMyProfileAsONG => 'Configurar perfil como ONG';
  static const String editProfile = 'Editar meu perfil';
}

class PostDetailsStrings {
  static const String loadingVideoFirstTime = 'Carregando video...\n\nAguarde isso só\nvai acontecer dessa vez 😃';
  static String get lastSeen => 'Visto pela última vez em';

  static String whereIsIt({
    required String petName,
    required String petGender,
  }) {
    if (petGender == male)
      return 'Onde ele está';
    else if (petGender == female) return 'Onde ela está';
    return 'Onde está o PET';
  }

  static String get preparingPostToShare => 'Preparando o post para compartilhar';
  static String get videoPlayerError => 'Erro ao reproduzir o video';
  static String get describBreed => 'Escreva o nome da raça';
  static String get petDisappeared => 'Desaparecido';
  static String get selectSpecie => 'Selecione a espécie';
  static String get caracteristics => 'Características';
  static String get selectBreed => 'Selecione a raça';
  static String get hermaphrodite => 'Hermafrodita';
  static String get disappeared => 'Desaparecido';
  static String get health => 'Estado de Saúde';
  static String get description => 'Descrição';
  static String get detailsOf => 'Detalhes de';
  static String get announcer => 'Anunciante';
  static String get reward => 'Recompensa';
  static String get none => 'Não tem';
  static String get size => 'Tamanho';
  static String get female => 'Fêmea';
  static String get breed => 'Raça';
  static String get male => 'Macho';
  static String get age => 'Idade';
  static String get color => 'Cor';
  static String get sex => 'Sexo';
}

class MoreStrings {
  static const String allowContactViaWhatsApp = 'Permitir contato via WhatsApp';
  static const String updatingProfile = 'Atualizando perfil...';
  static const String profileUpdated = 'Perfil atualizado';
  static const String deleteAccount = 'Apagar minha conta';
  static const String howCallYou = 'Como devo te chamar?';
  static const String whatsapp = 'Seu número de WhatsApp';
  static const String insertAPicture = 'Insira uma foto';
  static const String myAds = 'Minhas postagens';
  static const String myProfile = 'Meu perfil';
}

class MyProfileOptionsTile {
  static const String adoptioinForm = 'Formulário de Adoção';
  static const String deleteAccount = 'Deletar minha conta';
  static const String about = 'Sobre o aplicativo';
  static const String myPosts = 'Minhas Postagens';
  static const String talkWithUs = 'Fale conosco';
  static const String settings = 'Configurações';
  static const String partners = 'Parceiros';
  static const String ourNet = 'Nossa redes';
  static const String messages = 'Mensagens';
  static const String saveds = 'Salvos';
  static const String support = 'Apoie';
  static const String leave = 'Sair';
}

class PostFlowStrings {
  static String whereIsIt({
    required String petName,
    required String petGender,
    bool isDisappeared = false,
  }) {
    final cuttedName = petName.split(' ').first;
    if (isDisappeared) return 'Onde foi visto pela última vez?';

    if (petGender == PostDetailsStrings.male) {
      return 'Onde está o $cuttedName?';
    } else if (petGender == PostDetailsStrings.female) {
      return 'Onde está a $cuttedName?';
    }

    return 'Onde está o PET?';
  }

  static const String stillSendingAd = 'Ainda fazendo seu publicação...\n\nPor favor, aguarde nesta tela!';
  static const String videoSizeExceed = 'Tamanho máximo do vídeo excedido!\nO vídeo deve ter até 1:30 min';
  static const String postCancelMessage = 'Saindo agora todos os dados serão perdidos.\nContinuar?';
  static const String otherCaracteristicsOptional = 'Outras características (Opcional)';
  static const String insertVideo = 'Insira um vídeo - máx 1:30 min (Opcional)';
  static const String reviewYourPost = 'Clique no card para revisar seu post';
  static const String describeDiseaseType = 'Descreva qual o tipo de doença';
  static const String insertAtLeastOnePicture = 'Insira pelo menos uma foto';
  static const String deletingAd = 'Deletando postagens...';
  static const String adDeleted = 'Postagem Excluída!';
  static String imageQty(int imagesQty) {
    return imagesQty > 1 ? 'Enviando as fotos...' : 'Enviando a foto...';
  }

  static const String isThisPetDisappeared = 'Este PET está desaparecido?';
  static const String fillFullAddress = 'Preencher endereço completo?';
  static const String otherCaracteristics = 'Outras caracteristicas';
  static const String provideMoreDetails = 'Fornecer mais detalhes';
  static const String allDone = 'Tudo pronto, olha como vai ficar!';
  static const String selectPetType = 'Selecione o tipo de PET';
  static const String addVideo = 'Se quiser, adicione um vídeo.';
  static const String moreDetails = 'Mais detalhes e descrição';
  static const String addDescription = 'Adicione uma descrição';
  static const String fillAdData = 'Preencher dados da postagem';
  static const String addMorePictures = 'Adicionar mais fotos';
  static const String postCancelTitle = 'Cancelar postagem?';
  static const String sendingVideo = 'Enviando o vídeo...';
  static const String typeAddress = 'Digite o endereço';
  static const String deleteForever = 'Excluir post?';
  static const String sendingData = 'Enviando dados...';
  static const String postUpdate = 'Atualizar post';
  static const String reward = 'Recompensa (Opcional)';
  static const String finalizing = 'Finalizando...';
  static const String removeVideo = 'Remover vídeo';
  static const String deleteAd = 'Apagar post';
  static const String picTime = 'Hora das fotos!';
  static const String editAd = 'Editar post';
  static const String petsData = 'Dados do PET';
  static const String reviewButton = 'Revisar';
  static const String size = 'Tamanho do PET';
  static const String petType = 'Tipo de PET';
  static const String posting = 'Postando...';
  static const String details = 'Detalhes';
  static const String pictures = 'Fotos';
  static const String videos = 'Videos';
  static const String review = 'Revisar';
  static const String petName = 'Nome';
  static const String state = 'Estado';
  static const String delete = 'Apagar';
  static const String months = 'Meses';
  static const String local = 'Local';
  static const String city = 'Cidade';
  static const String post = 'Postar';
  static const String years = 'Anos';
  static const String data = 'Dados';
  static const String age = 'Idade';
}

class ChatStrings {
  static const String deleteMessageQuestion = 'Tem certeza que deseja deletar essa conversa?';
  static String dennounceUser(String username) => 'Denunciar $username';
  static const String writeYourMessage = 'Escreva sua mensagem...';
  static const String startConversation = 'Incie a conversa';
  static const String noContact = 'Nenhum contato ainda';
  static const String deleteMessage = 'Apagar mensagem';
  static const String myMessages = 'Minhas Mensagens';
  static const String deleteChat = 'Apagar conversa';
  static const String news = 'Nova';
}

class DeleteAccountStrings {
  static const String deletingAccountStarting = 'Inicializando exclusão de conta';
  static const String foreverDeletedAccount = 'Conta excluída pra sempre!';
  static const String noPetInMyRegion = 'Nenhum PET na minha região';
  static const String alreadyFoundPet = 'Já encontrei meu PET';
  static const String tellUsTheMotive = 'Conte-nos o motivo';
  static const String whichBugs = 'Quais bugs aconteceram?';
  static const String cannotUse = 'Não consigo usar o app';
  static const String alreadyAdopted = 'Já adotei um PET';
  static const String deletingAds = 'Excluíndo postagens';
  static const String alreadyDonated = 'Já doei meu PET';
  static const String deleteAccount = 'Excluir conta';
  static const String muchAds = 'Muitos anúncios';
  static const String finishing = 'Finalizando';
  static const String other = 'Outro';
  static const String bugs = 'Bugs';
}

class FeedbackStrings {
  static const String partnershipWarning = 'Deixe informações corretas para entrarmos em contato com você!';
  static const String sendingYourMessage = 'Enviando sua mensagem para o administrador';
  static const String wannaAnnounceOnApp = 'Quero anunciar minha empresa no Tiu, tiu';
  static const String failureWarning = 'Algo deu errado ao enviar seu feedback.';
  static const String successSent = 'Sua mensagem foi enviada com sucesso!';
  static const String anotherUserIssue = 'Problema com outro usuário';
  static const String writeYourMessage = 'Escreva sua mensagem';
  static const String dificultsUse = 'Dificuldade ao usar o app';
  static const String subject = 'Sobre o quê você quer falar';
  static const String tryingAgain = 'Tentando de novo';
  static const String addImages = 'Adicionar fotos';
  static const String partnership = 'Parceria';
  static const String dennounce = 'Denúncia';
  static const String failure = 'Falha';
}

class SupportUsStrings {
  static const String helpMaintainTheApp = 'Ajude-nos a manter este aplicativo!';
  static const String keyPixCopied = 'Chave copiada!';
  static const String copyKey = 'Copiar chave';
}

class PostDennounceStrings {
  static const String announceNoAnswer = 'Anunciante não responde';
  static const String fake = 'É uma publicação enganosa';
  static const String sexualContent = 'Conteúdo Sexual';
  static const String other = 'Outro';
}

class DennounceStrings {
  static const String dennounceSentSuccessfully = 'Sua denúncia foi enviada com sucesso!';
  static const String whichIsDennounceMotive = 'Qual motivo da sua denúncia?';
  static const String specifyDennounceMotive = 'Especifique o motivo';
  static const String dennounce = 'Denunciar';
}

class UserDennounceStrings {
  static const String sexualAppeal = 'Apelação sexual';
  static const String scamTry = 'Tentativa de golpe';
  static const String other = 'Outro';
}

class GreetingStrings {
  static const String goodAfternoon = 'Boa tarde';
  static const String goodMorning = 'Bom dia';
  static const String goodNight = 'Boa noite';
}

class AdoptionFormStrings {
  static const String aboutForm =
      'Gere e compartilhe um formulário de adoção em formato PDF ou em formato de mensagens do WhatsApp em poucos segundos.';
  static const String youDontNeedAnAccount = 'Você não precisa de ter uma conta e pode acessar sempre que quiser.';
  static const String onlyAnwerWhatYouWant = 'Só responda às perguntas que se sentir confortável em responder.';
  static const String formFilledSuccess = 'Prontinho, formulário salvo com sucesso! O que deseja fazer?';
  static const String generateAndShareEmptyFormTXT = 'Gerar e compartilhar um formulário vazio (Texto)';
  static const String generateAndShareEmptyFormPDF = 'Gerar e compartilhar um formulário vazio (PDF)';
  static const String allQuestionsAreOptionals = 'Todas as questões são opcionais.';
  static const String backgroundInfo = 'Verificação de antecedentes e contatos';
  static const String chooseFormFormat = 'Escolha o formato que deseja enviar';
  static const String shareMyFormTXT = 'Compartilhar meu formulário (Texto)';
  static const String shareMyFormPDF = 'Compartilhar meu formulário (PDF)';
  static const String financialInfo = 'Tempo e recursos financeiros';
  static const String referenceContacts = 'Contatos de referência';
  static const String whatYouWannaDo = 'O que deseja fazer?';
  static const String personalInfo = 'Informações Pessoais';
  static const String adoptionForm = 'Formulário de adoção';
  static const String editMyForm = 'Editar meu formulário';
  static const String formPdfName = 'Formulário de Adoção';
  static const String houseInfo = 'Sobre sua residência';
  static const String fillForm = 'Preencher formulário';
  static const String justThis = 'Por enquanto é só';
  static const String petInfo = 'Sobre o animal';
  static const String update = 'Atualizar';
  static const String start = 'Iniciar';
  static const String note = 'Nota';
}

class AdoptionFormQuestionsStrings {
  static const String allowCheckBackground = 'Você está disposto a passar por uma verificação de antecedentes?';
  static const String haveMoneyEnough =
      'Você tem recursos financeiros para cuidar de um animal? (ração, vacinação, consultas veterinárias)';
  static const String haveAnimals = 'Você tem outros animais em casa? Se sim, quais e quantos?';
  static const String haveTimeEnough = 'Você tem tempo suficiente para cuidar de um animal?';
  static const String haveChildren = 'Você tem crianças? Se sim, quantas e que idades têm?';
  static const String petExperience = 'Você tem experiência com esse tipo de animal?';
  static const String reason = 'Por quê você quer adotar esse animal em particular?';
  static const String allowGetInContatactWithReferences =
      'Você autoriza que entre em contato com seus contatos de referências?';
  static const String petType = 'Que tipo de animal está interessado';
  static const String houseTypeOptions = 'Casa, apartamento, sítio...';
  static const String petBreed = 'Qual a raça que está interessado';
  static const String houseType = 'Qual é o seu tipo de imóvel?';
  static const String maritalStatus = 'Estado Civil';
  static const String haveYard = 'Você tem quintal?';
  static const String fullname = 'Nome Completo';
  static const String profession = 'Profissão';
  static const String address = 'Endereço';
  static const String phone = 'Telefone';
  static const String email = 'E-mail';
  static const String age = 'Idade';
}

class MaritalStatusStrings {
  static const String marriedSeparated = 'Casado com separação de fato';
  static const String stableUnion = 'União Estável';
  static const String divorced = 'Divorciado';
  static const String separated = 'Separado';
  static const String single = 'Solteiro';
  static const String married = 'Casado';
  static const String widower = 'Viúvo';
}

class AppClosedStrings {
  static const String willNotLate = 'Vai ser rápido, entre novamente em alguns minutinhos!';
  static const String closedForMaintenance = 'Fechado para manutenção';
}
