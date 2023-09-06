class ApplicationController < ActionController::Base
  before_action :set_locale

  #include Pundit
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include Pagy::Backend

  #-----------------------------------------------------------------------------
  private

    #keep the locale through links
    def default_url_options(options = {})
      {locale: I18n.locale}
    end

    #set language for internationalization
    def set_locale
      if params[:locale].blank?
        if current_user.present?
          if current_user.language.present?
            params[:locale] = current_user.language
          else
            # Se non ho assegnato il parametro :locale e non ho una lingua per l'utente loggato, allora gli passo la lingua impostata sul browser
            # (per testare usa Google chrome Extension: Locale Switcher)
            params[:locale] = request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
          end
        else
          params[:locale] = request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
        end
      end

      case params[:locale]
      #when "it", "en", "pt"
      when "it", "pt"
        I18n.locale = params[:locale]
      else
        I18n.locale = I18n.default_locale
      end
    end

    # Pundit rescue_from
    def user_not_authorized
      redirect_to request.referrer || root_path, notice: t("pundit.you_are_not_authorized")
    end
end
