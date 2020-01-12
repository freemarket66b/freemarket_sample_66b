class SignupController < ApplicationController
  before_action :validates_signup2, only: :signup3 # signup2のバリデーション
  before_action :validates_signup3, only: :signup4 # signup3のバリデーション
  before_action :validates_signup4, only: :create # signup4のバリデーション

  def signup2
    @user = User.new # 新規インスタンス作成
  end

  def signup3
    @user = User.new
  end

  def signup4
    @user = User.new
  end

  def signup5
    sign_in User.find(session[:id]) unless user_signed_in?
    
  end

  def validates_signup2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_day] = user_params[:birth_day]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_day: session[:birth_day],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      prefectures: "北海道",
      phone_number: "09012345678",
      first_name_delivery: "名字",
      first_name_kana_delivery: "みょうじ",
      last_name_delivery: "名前",
      last_name_kana_delivery: "なまえ",
      postal_code: "123-4567"
    )
    render '/signup/signup2' unless @user.valid?
  end

  def validates_signup3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_day: session[:birth_day],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      phone_number: session[:phone_number],
      prefectures: "北海道",
      first_name_delivery: "名字",
      first_name_kana_delivery: "みょうじ",
      last_name_delivery: "名前",
      last_name_kana_delivery: "なまえ",
      postal_code: "123-4567"
    )
    render '/signup/signup3' unless @user.valid?
  end

  def validates_signup4
    session[:first_name_delivery] = user_params[:first_name_delivery]
    session[:first_name_kana_delivery] = user_params[:first_name_kana_delivery]
    session[:last_name_delivery] = user_params[:last_name_delivery]
    session[:last_name_kana_delivery] = user_params[:last_name_kana_delivery]
    session[:postal_code] = user_params[:postal_code]
    session[:address] = user_params[:address]
    session[:city] = user_params[:city]
    session[:building_name] = user_params[:building_name]
    session[:phone_number_delivery] = user_params[:phone_number_delivery]
    session[:prefectures] = user_params[:prefectures]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_day: session[:birth_day],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      phone_number: session[:phone_number],
      first_name_delivery: session[:first_name_delivery],
      first_name_kana_delivery: session[:first_name_kana_delivery],
      last_name_delivery: session[:last_name_delivery],
      last_name_kana_delivery: session[:last_name_kana_delivery],
      prefectures: session[:prefectures],
      postal_code: session[:postal_code],
      city: session[:city],
      address: session[:address]
    )
    render '/signup/signup4' unless @user.valid?
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      # password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_day: session[:birth_day],
      postal_code: session[:postal_code],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      phone_number: session[:phone_number],
      first_name_delivery: session[:first_name_delivery],
      first_name_kana_delivery: session[:first_name_kana_delivery],
      last_name_delivery: session[:last_name_delivery],
      last_name_kana_delivery: session[:last_name_kana_delivery],
      city: session[:city],
      address: session[:address],
      prefectures: session[:prefectures]
    )

    if @user.save # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to signup5_signup_index_path
    else
      render 'devise/registrations/new'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
 
  end

  private
  def user_params
    params.require(:user).permit(
      :password, :email, :nickname,
      :last_name, :first_name, :last_name_kana, :first_name_kana,
      :birth_day, :birth_year, :birth_month,:profile, :phone_number, :city, :address, :postal_code, :building_name, :prefectures,
      :first_name_delivery, :first_name_kana_delivery, :last_name_delivery, :last_name_kana_delivery,:phone_number_delivery)
  end
end