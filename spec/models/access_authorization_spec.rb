require 'rails_helper'

RSpec.describe AccessAuthorization, type: :model do
  describe 'アソシエーションについて' do
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(AccessAuthorization.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
