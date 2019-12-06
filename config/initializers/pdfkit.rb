class Application < Rails::Application
    PDFKit.configure do |config|
        config.wkhtmltopdf=Rails.root.join('bin','wkhtmltopdf').to_s
    end
end