PDFKit.configure do |config|
    config.wkhtmltopdf=rails.root.join('bin','wkhtmltopdf').to_s
end