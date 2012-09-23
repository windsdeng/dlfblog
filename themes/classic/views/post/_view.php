<li>
    <!-- 文章开始 --> 
    <div class="post-text">
        <div class="title">
          <a href="#" target="_blank" title="name" class="author"></a>
            <i class="line_h"></i>
            <h3><?php echo CHtml::link(CHtml::encode($data->title), $data->url); ?></h3>
            <p>
              <?php echo $data->author->username; ?> /
              <?php echo CHtml::link("{$data->category->name}",
                      array('post/index','category'=>$data->category->id,'alias'=>$data->category->alias),
                      array('title'=>$data->category->name,'target'=>'_blank')) ?>/
                <span><?php echo date('F j, Y',$data->created) ?></span> / 
                 标签: <?php echo implode(', ', $data->tagLinks); ?>
            </p>
            <?php echo CHtml::link("{$data->commentCount}",$data->url.'#comments',array('class'=>'up','title'=>"{$data->commentCount}条评论")); ?> 
        </div>
        
       <!-- <div class="post-banner"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/1294987190_56.jpg" alt="post-banner" /></div> -->
       
        <div class="text">
            <?php
                $this->beginWidget('CMarkdown', array('purifyOutput'=>true));
                echo $data->content;
                $this->endWidget();
            ?> 
        </div>
        <div class="tools-bar">
            <ul>
              <!--<li class="browse">浏览:5,877</li> -->
              <li class="share"></li>
            </ul>
            <?php echo CHtml::link(CHtml::encode("阅读全文"), $data->url,array('class'=>'more','target'=>'_blank','title'=>'阅读全文')); ?>
            <div class="clear"></div>
        </div>
     </div>
     <!-- 文章结束 --> 
 </li>