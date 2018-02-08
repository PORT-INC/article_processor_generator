# frozen_string_literal: true

# rubocop:disable Rails/OutputSafety
class Article::AdFilter < Handsaw::Filters::IndentedParagraph
  include HtmlBuilder
  def template
    # 二回目以降は無視
    return if @skip_render
    @skip_render ||= true
    markup do |t|
      if context[:variant] == :pc && !context[:article]&.employ?
        t.div class: 'article-pc-ad' do
          t.ul class: 'pa-adGroup' do
            t.li pc_left_script, class: 'pa-adGroup__item'
            t.li pc_right_script, class: 'pa-adGroup__item'
          end
        end
      end
    end
  end

  def pc_left_script
    <<~EOS.html_safe
      <!-- /60619293/p_careerpark_kijinaka1_336x280 -->
      <div id='div-gpt-ad-1468459007927-2'>
        <script type='text/javascript'>
          googletag.cmd.push(function() { googletag.display('div-gpt-ad-1468459007927-2'); });
        </script>
      </div>
    EOS
  end

  def pc_right_script
    <<~EOS.html_safe
      <!-- /60619293/p_careerpark_kijinaka2_336x280 -->
      <div id='div-gpt-ad-1468459007927-3'>
        <script type='text/javascript'>
          googletag.cmd.push(function() { googletag.display('div-gpt-ad-1468459007927-3'); });
        </script>
      </div>
    EOS
  end

  def pc_left_script_employ
    <<~EOS.html_safe
      <!-- /60619293/p_careerpark_shukatsu_kijinaka1_336x280 -->
      <div id='div-gpt-ad-1473242622577-2'>
        <script>
          googletag.cmd.push(function() { googletag.display('div-gpt-ad-1473242622577-2'); });
        </script>
      </div>
    EOS
  end

  def pc_right_script_employ
    <<~EOS.html_safe
      <!-- /60619293/p_careerpark_shukatsu_kijinaka2_336x280 -->
      <div id='div-gpt-ad-1473242622577-3'>
        <script>
          googletag.cmd.push(function() { googletag.display('div-gpt-ad-1473242622577-3'); });
        </script>
      </div>
    EOS
  end

  def sp_script_employ
    <<~EOS.html_safe
      <!-- /60619293/s_careerpark_shukatsu_kijinaka_336x280 -->
      <div id='div-gpt-ad-1473241709458-1'>
        <script>
          googletag.cmd.push(function() { googletag.display('div-gpt-ad-1473241709458-1'); });
        </script>
      </div>
    EOS
  end
end
