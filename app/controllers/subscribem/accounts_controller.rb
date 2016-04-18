require_dependency "subscribem/application_controller"

module Subscribem
  class AccountsController < ApplicationController
    #sign_up form and new account
    def new
      @account = Subscribem::Account.new
      @account.build_owner
    end

    #create new account
    def create
      @account = Subscribem::Account.create(accounts_params)
      if @account.save
        env["warden"].set_user(@account.owner, :scope => :user)
        env["warden"].set_user(@account, :scope => :account)
        flash[:success] = "Your account has been successfully created."
        redirect_to subscribem.root_url(:subdomain => @account.subdomain)
      else
        flash[:error] = "Sorry, your account could not be created."
        render :new
      end
    end

    private

    #definestrong parameters for account
    def accounts_params
      params.require(:account).permit(:name, :subdomain, {:owner_attributes => [
        :email, :password, :password_confirmation
      ]})
    end
  end
end
