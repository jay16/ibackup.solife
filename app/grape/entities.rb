module APIEntities
  class User < Grape::Entity
    format_with(:ymdhms_format) { |t| t.strftime("%Y-%m-%d %H:%M:%S") }

    expose :id, :name, :email
    with_options(format_with: :ymdhms_format) do
      expose :created_at
    end
  end

  class Phone < Grape::Entity
    expose :id, :serial, :brand, :host, :fingerprint, :manufacturer
    expose :model, :incremental, :product, :devise, :release
  end

  class Sms < Grape::Entity
    expose :id, :id_id, :number, :date, :name, :content, :type
  end

  class Contact < Grape::Entity
    expose :id, :id_id, :number, :name, :photo, :type
  end
end