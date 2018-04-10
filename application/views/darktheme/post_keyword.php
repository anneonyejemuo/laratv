<section id="post">
    <?php if(!empty($key_image)) { ?>
        <div class="row category-head"  style="background-image: url('<?php echo $key_image; ?>');">
            <div class="<?php if(!empty($key_image)) echo 'category-dark-background'; ?>"></div>
        </div>
    <?php } ?>
	<div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="post-title container-mobile">
                    <h1><?php echo $this->lang->line('Keyword :'); ?> <?php if(isset($key_title)) echo $key_title; ?></h1>
                    <div class="m-t-10">
                        <?php if(isset($description)) echo $description; ?>
                    </div>
                </div>
                <hr>
            </div>
        </div>
        <div class="row">
            <div id="content" class="col-sm-9">
                <div class="row">
                    <?php if(isset($getKeywordPosts)) echo $getKeywordPosts; ?>
                </div>
                <div class="row container-mobile">
                    <div class="col-sm-12">
                        <div class="text-right">
                            <?php if(isset($getPagination)) echo $getPagination; ?>
                        </div>
                    </div> <!-- end col -->
                </div> <!-- end row -->
            </div>
            <div id="sidebar" class="col-sm-12 col-lg-3">
                <div class="container-mobile">
                    <?php if(!empty($this->config->item('sidebartop'))) { ?>
                        <div class="widget">
                            <h4 class="h5"><?php echo $this->lang->line('Advertisement'); ?></h4>
                            <?php echo $this->config->item('sidebartop'); ?>
                        </div>
                    <?php } ?>
                    <div class="widget widget-latest">
                        <h4 class="h5"><?php echo $this->lang->line('RECENT POSTS'); ?></h4>
                        <?php if(isset($getLastPosts)) echo $getLastPosts; ?>
                    </div>
                    <?php if(!empty($this->config->item('facebookPageLink'))) { ?>
                        <div class="widget">
                            <h4 class="h5"><?php echo $this->lang->line('SOCIALIZE WITH US'); ?></h4>
                            <div class="fb-page" data-href="<?php echo $this->config->item('facebookPageLink'); ?>" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="<?php echo $this->config->item('facebookPageLink'); ?>" class="fb-xfbml-parse-ignore"><a href="<?php echo $this->config->item('facebookPageLink'); ?>"><?php echo $this->config->item('facebookPageName'); ?></a></blockquote></div>
                        </div>
                    <?php } ?>
                    <?php if(!empty($this->config->item('sidebarbottom'))) { ?>
                        <div class="widget">
                            <h4 class="h5"><?php echo $this->lang->line('Advertisement'); ?></h4>
                            <?php echo $this->config->item('sidebarbottom'); ?>
                        </div>
                    <?php } ?>
                </div>
            </div> <!-- end content -->
        </div>
	</div> <!-- end container -->
</section>
