# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    layout 'users_auth'
    before_action :configure_sign_up_params, only: [:create]

    # before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    def new
      @user = User.new
      @user.build_company
      @user.company.build_privacy_policy
      email_arr = User.pluck(:email)
      gon.email_arr = email_arr
    end

    # POST /resource
    def create
      # ここでUser.new（と同等の操作）を行う
      build_resource(sign_up_params)

      # ここでUser.save（と同等の操作）を行う
      resource.save

      # PrivacyPolicy新規作成・保存
      create_privacy_policy!

      # ブロックが与えられたらresource(=User)を呼ぶ
      yield resource if block_given?
      if resource.persisted?
        # 先程のresource.saveが成功していたら
        if resource.active_for_authentication?
          # confirmable/lockableどちらかのactive_for_authentication?がtrueだったら
          # flashメッセージを設定
          set_flash_message! :notice, :signed_up
          # サインアップ操作
          sign_up(resource_name, resource)
          # リダイレクト先を指定
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          # sessionを削除
          expire_data_after_sign_in!
          redirect_to registration_comp_path, flash: { success: '送られてくるメールの認証URLからアカウントの認証をしてください。' }
        end
      else
        # 先程のresource.saveが失敗していたら
        # passwordとpassword_confirmationをnilにする
        clean_up_passwords resource
        # validatable有効時に、パスワードの最小値を設定する
        set_minimum_password_length
        render :new
      end
    end

    # PrivacyPolicy新規作成・保存
    def create_privacy_policy!
      @privacy_policy = PrivacyPolicy.new
      @privacy_policy.company_id = User.find_by(name: params[:user][:name]).company_id
      # Markdownでhinagata作成・表示するためインデントは無し
      @hinagata = "
■■■■■■■■■■■（以下，「当社」といいます。）は，本ウェブサイト上で提供するサービス（以下,「本サービス」といいます。）における，ユーザーの個人情報の
取扱いについて，以下のとおりプライバシーポリシー（以下，「本ポリシー」といいます。）を定めます。

##第1条（個人情報）

「個人情報」とは，個人情報保護法にいう「個人情報」を指すものとし，生存する個人に関する情報であって，当該情報に含まれる氏名，生年月日，住所，
電話番号，連絡先その他の記述等により特定の個人を識別できる情報及び容貌，指紋，声紋にかかるデータ，及び健康保険証の保険者番号などの
当該情報単体から特定の個人を識別できる情報（個人識別情報）を指します。

##第2条（個人情報の収集方法）
当社は，ユーザーが利用登録をする際に氏名，生年月日，住所，電話番号，メールアドレス，銀行口座番号，クレジットカード番号，運転免許証番号などの個人情報をお尋ねすることがあります。
また，ユーザーと提携先などとの間でなされたユーザーの個人情報を含む取引記録や決済に関する情報を,当社の提携先（情報提供元，広告主，広告配信先などを含みます。以下，｢提携先｣といいます。）などから収集することがあります。

##第3条（個人情報を収集・利用する目的）

当社が個人情報を収集・利用する目的は，以下のとおりです。

1. 当社サービスの提供・運営のため
1. ユーザーからのお問い合わせに回答するため（本人確認を行うことを含む）
1. ユーザーが利用中のサービスの新機能，更新情報，キャンペーン等及び当社が提供する他のサービスの案内のメールを送付するため
1. メンテナンス，重要なお知らせなど必要に応じたご連絡のため
1. 利用規約に違反したユーザーや，不正・不当な目的でサービスを利用しようとするユーザーの特定をし，ご利用をお断りするため
1. ユーザーにご自身の登録情報の閲覧や変更，削除，ご利用状況の閲覧を行っていただくため
1. 有料サービスにおいて，ユーザーに利用料金を請求するため
1. 上記の利用目的に付随する目的

##第4条（利用目的の変更）

1. 当社は，利用目的が変更前と関連性を有すると合理的に認められる場合に限り，個人情報の利用目的を変更するものとします。
1. 利用目的の変更を行った場合には，変更後の目的について，当社所定の方法により，ユーザーに通知し，または本ウェブサイト上に公表するものとします。

##第5条（個人情報の第三者提供）
1 .当社は，次に掲げる場合を除いて，あらかじめユーザーの同意を得ることなく，第三者に個人情報を提供することはありません。ただし，個人情報保護法その他の法令で認められる場合を除きます。

  1. 人の生命，身体または財産の保護のために必要がある場合であって，本人の同意を得ることが困難であるとき
  1. 公衆衛生の向上または児童の健全な育成の推進のために特に必要がある場合であって，本人の同意を得ることが困難であるとき
  1. 国の機関もしくは地方公共団体またはその委託を受けた者が法令の定める事務を遂行することに対して協力する必要がある場合であって，本人の同意を得ることにより当該事務の遂行に支障を及ぼすおそれがあるとき
  1. 予め次の事項を告知あるいは公表し，かつ当社が個人情報保護委員会に届出をしたとき

      1. 利用目的に第三者への提供を含むこと
      1. 第三者に提供されるデータの項目
      1. 第三者への提供の手段または方法
      1. 本人の求めに応じて個人情報の第三者への提供を停止すること
      1. 本人の求めを受け付ける方法

2.前項の定めにかかわらず，次に掲げる場合には，当該情報の提供先は第三者に該当しないものとします。

  1. 当社が利用目的の達成に必要な範囲内において個人情報の取扱いの全部または一部を委託する場合
  1. 合併その他の事由による事業の承継に伴って個人情報が提供される場合
  1.個人情報を特定の者との間で共同して利用する場合であって，その旨並びに共同して利用される個人情報の項目，共同して利用する者の範囲，
  利用する者の利用目的および当該個人情報の管理について責任を有する者の氏名または名称について，あらかじめ本人に通知し，または本人が容易に知り得る状態に置いた場合

##第6条（個人情報の開示）

1.当社は，本人から個人情報の開示を求められたときは，本人に対し，遅滞なくこれを開示します。ただし，開示することにより次のいずれかに該当する場合は，その全部または一部を開示しないこともあり，開示しない決定をした場合には，その旨を遅滞なく通知します。

  1. 本人または第三者の生命，身体，財産その他の権利利益を害するおそれがある場合
  1. 当社の業務の適正な実施に著しい支障を及ぼすおそれがある場合
  1. その他法令に違反することとなる場合

2.前項の定めにかかわらず，履歴情報および特性情報などの個人情報以外の情報については，原則として開示いたしません。

##第7条（個人情報の訂正および削除）

1. ユーザーは，当社の保有する自己の個人情報が誤った情報である場合には，当社が定める手続きにより，当社に対して個人情報の訂正，追加または削除（以下，「訂正等」といいます。）を請求することができます。
1. 当社は，ユーザーから前項の請求を受けてその請求に応じる必要があると判断した場合には，遅滞なく，当該個人情報の訂正等を行うものとします。
1. 当社は，前項の規定に基づき訂正等を行った場合，または訂正等を行わない旨の決定をしたときは遅滞なく，これをユーザーに通知します。

##第8条（個人情報の利用停止等）

1. 当社は，本人から，個人情報が，利用目的の範囲を超えて取り扱われているという理由，または不正の手段により取得されたものであるという理由により，その利用の停止または消去（以下，「利用停止等」といいます。）を求められた場合には，遅滞なく必要な調査を行います。
1. 前項の調査結果に基づき，その請求に応じる必要があると判断した場合には，遅滞なく，当該個人情報の利用停止等を行います。
1. 当社は，前項の規定に基づき利用停止等を行った場合，または利用停止等を行わない旨の決定をしたときは，遅滞なく，これをユーザーに通知します。
1. 前2項にかかわらず，利用停止等に多額の費用を有する場合その他利用停止等を行うことが困難な場合であって，ユーザーの権利利益を保護するために必要なこれに代わるべき措置をとれる場合は，この代替策を講じるものとします。

##第9条（プライバシーポリシーの変更）

1. 本ポリシーの内容は，法令その他本ポリシーに別段の定めのある事項を除いて，ユーザーに通知することなく，変更することができるものとします。
1. 当社が別途定める場合を除いて，変更後のプライバシーポリシーは，本ウェブサイトに掲載したときから効力を生じるものとします。

##第10条（お問い合わせ窓口）
本ポリシーに関するお問い合わせは，下記の窓口までお願いいたします。
住所：■■■■■■■■■■■
社名：■■■■■■■■■■■
担当部署：■■■■■■■■■■■
Eメールアドレス：■■■■■■■■■■■

以上
                    "
      @privacy_policy.content = @hinagata

      @privacy_policy.save
    end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected

    def after_update_path_for(_resource)
      users_profile_path
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, { company_attributes: [:name] }])
    end

    def email_data; end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
