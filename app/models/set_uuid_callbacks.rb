# idカラムに乱数を格納する処理
class SetUuidCallbacks
  def before_create(record)
    record.id = SecureRandom.uuid
  end
end
