require 'require_date'

describe RequireDate do

  let(:date_format) { RequireDate::FORMATS[:date] }
  let(:month_format) { RequireDate::FORMATS[:month_group] }

  ARGV[0] = '2014-05-05'
  ARGV[1] = '20140507'
  ARGV[2] = '2014-02'

  it 'raises an error when trying to pull an no argument matches format' do
    expect { RequireDate.next(/\A\z/) }.to raise_error(ArgumentError)
  end

  it 'pulls the first date' do
    return_value = RequireDate.next(date_format)
    expect(return_value).to eq('2014-05-05')
  end

  it 'pulls the second date' do
    return_value = RequireDate.next(date_format)
    expect(return_value).to eq('20140507')
  end

  it 'raises an error when trying to pull a third date' do
    expect { @start_day = RequireDate.next(date_format) }.to raise_error(ArgumentError)
  end

  it 'pulls the third date' do
    return_value = RequireDate.next(month_format)
    expect(return_value).to eq('2014-02')
  end

  it 'raises an error when trying to pull a second month group' do
    expect { @start_day = RequireDate.next(month_format) }.to raise_error(ArgumentError)
  end

end
