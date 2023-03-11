module ApplicationHelper
  def default_meta_tags
    {
      site: 'ネタログ',
      title: 'ネタログ',
      reverse: true,
      separator: '|',
      description: 'ページの説明',
      keywords: 'お笑い, ネタ, ログ, ネタログ, コント',
      charset: 'utf-8',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.jpg'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        # site: '@ツイッターのアカウント名',
        image: image_url('ogp.jpg')
      }
    }
  end
end
