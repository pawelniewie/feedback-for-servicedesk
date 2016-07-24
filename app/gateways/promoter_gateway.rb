class PromoterGateway
  def self.create_or_update_template(project_configuration)

  end

  def self.send_test_email(project_configuration, email)

  end

  def self.supported_languages
    {
      'hr': 'Croatian',
      'cs': 'Czech',
      'da': 'Danish',
      'nl': 'Dutch',
      'en': 'English',
      'fi': 'Finnish',
      'fr-CA': 'French (Canada)',
      'fr-FR': 'French (France)',
      'de': 'German',
      'el': 'Greek',
      'hi': 'Hindi',
      'is': 'Icelandic',
      'id': 'Indonesian',
      'it': 'Italian',
      'ja': 'Japanese',
      'ko': 'Korean',
      'pl': 'Polish',
      'pt-BR': 'Portuguese (Brazil)',
      'pt': 'Portuguese (Portugal)',
      'ro': 'Romanian',
      'ru': 'Russian',
      'es-419': 'Spanish (Latin America)',
      'es-ME': 'Spanish (Mexico)',
      'es-ES': 'Spanish (Spain)',
      'sv': 'Swedish',
      'tr': 'Turkish',
      'uk': 'Ukrainian',
      'vi': 'Vietnamese'
    }
  end
end