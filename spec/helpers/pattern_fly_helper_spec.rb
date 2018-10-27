require 'rails_helper'

RSpec.describe PatternFlyHelper, type: :helper do
  describe '#pf_flash' do
    subject       { helper.pf_flash }
    let(:content) { 'Lorem' }

    context 'success' do
      before { flash[:success] = content }

      it { is_expected.to have_css('div.alert.fade.in.alert-success', text: content) }
      it { is_expected.to have_css('div.alert button.close[data-dismiss="alert"]', text: '×') }
    end

    context 'info' do
      before { flash[:info] = content }

      it { is_expected.to have_css('div.alert.fade.in.alert-info', text: content) }
      it { is_expected.to have_css('div.alert button.close[data-dismiss="alert"]', text: '×') }
    end

    context 'warning' do
      before { flash[:warning] = content }

      it { is_expected.to have_css('div.alert.fade.in.alert-warning', text: content) }
      it { is_expected.to have_css('div.alert button.close[data-dismiss="alert"]', text: '×') }
    end

    context 'danger' do
      before { flash[:danger] = content }

      it { is_expected.to have_css('div.alert.fade.in.alert-danger', text: content) }
      it { is_expected.to have_css('div.alert button.close[data-dismiss="alert"]', text: '×') }
    end

    context 'notice' do
      before { flash[:notice] = content }

      it { is_expected.to have_css('div.alert.fade.in.alert-success', text: content) }
      it { is_expected.to have_css('div.alert button.close[data-dismiss="alert"]', text: '×') }
    end

    context 'alert' do
      before { flash[:alert] = content }

      it { is_expected.to have_css('div.alert.fade.in.alert-danger', text: content) }
      it { is_expected.to have_css('div.alert button.close[data-dismiss="alert"]', text: '×') }
    end

    context 'error' do
      before { flash[:error] = content }

      it { is_expected.to have_css('div.alert.fade.in.alert-danger', text: content) }
      it { is_expected.to have_css('div.alert button.close[data-dismiss="alert"]', text: '×') }
    end

    context 'others' do
      before { flash[:lorem] = content }

      it { is_expected.to be_empty }
    end

    context 'with options passed' do
      before          { flash[:success] = content }
      subject         { helper.pf_flash options }
      let(:classname) { 'my-classname' }
      let(:options)   { { class: classname } }

      it { is_expected.to have_css('div.alert.fade.in.alert-success.my-classname', text: content) }
      it { is_expected.to have_css('div.alert button.close[data-dismiss="alert"]', text: '×') }
    end

    context 'multiple flashes' do
      before         { flash[:success] = content1 }
      before         { flash[:info] = content2 }
      let(:content1) { content }
      let(:content2) { content*2 }

      it { is_expected.to have_css('div.alert.fade.in.alert-success', text: content1) }
      it { is_expected.to have_css('div.alert.fade.in.alert-info', text: content2) }
      it { is_expected.to have_css('div.alert button.close[data-dismiss="alert"]', text: '×', count: 2) }
    end
  end
end
