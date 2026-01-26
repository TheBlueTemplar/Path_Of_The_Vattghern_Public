// no bueno
/*::TLW.HooksMod.hook("scripts/entity/tactical/legend_vala_warden_script", function ( q )
{	
	q.m.DistortTargetA <- null;
	q.m.DistortTargetPrevA <- this.createVec(0, 0);
	q.m.DistortAnimationStartTimeA <- 0;
	q.m.DistortTargetB <- null;
	q.m.DistortTargetPrevB <- this.createVec(0, 0);
	q.m.DistortAnimationStartTimeB <- 0;
	q.m.DistortTargetC <- null;
	q.m.DistortTargetPrevC <- this.createVec(0, 0);
	q.m.DistortAnimationStartTimeC <- 0;
	q.m.DistortTargetD <- null;
	q.m.DistortTargetPrevD <- this.createVec(0, 0);
	q.m.DistortAnimationStartTimeD <- 0;

	q.onRender <- function()
	{
		//__original();

		this.actor.onRender();

		// HEAD
	    if (this.m.DistortTargetA == null)
	    {
	        this.m.DistortTargetA = this.createVec(this.Math.rand(0, 12) - 6, this.Math.rand(0, 12) - 6);
	        this.m.DistortAnimationStartTimeA = this.Time.getVirtualTimeF();
	    }

	    if (this.moveSpriteOffset("head", this.m.DistortTargetPrevA, this.m.DistortTargetA, 2.77, this.m.DistortAnimationStartTimeA))
	    {
	        this.m.DistortAnimationStartTimeA = this.Time.getVirtualTimeF();
	        this.m.DistortTargetPrevA = this.m.DistortTargetA;
	        this.m.DistortTargetA = this.createVec(this.Math.rand(0, 12) - 6, this.Math.rand(0, 12) - 6);
	    }

	    // BLUR 1
	    if (this.m.DistortTargetB == null)
	    {
	        this.m.DistortTargetB = this.createVec(this.Math.rand(0, 12) - 6, this.Math.rand(0, 12) - 6);
	        this.m.DistortAnimationStartTimeB = this.Time.getVirtualTimeF();
	    }

	    if (this.moveSpriteOffset("blur_1", this.m.DistortTargetPrevB, this.m.DistortTargetB, 3.57, this.m.DistortAnimationStartTimeB))
	    {
	        this.m.DistortAnimationStartTimeB = this.Time.getVirtualTimeF();
	        this.m.DistortTargetPrevB = this.m.DistortTargetB;
	        this.m.DistortTargetB = this.createVec(this.Math.rand(0, 12) - 6, this.Math.rand(0, 12) - 6);
	    }

	    // BODY
	    if (this.m.DistortTargetC == null)
	    {
	        this.m.DistortTargetC = this.createVec(this.Math.rand(0, 12) - 6, this.Math.rand(0, 12) - 6);
	        this.m.DistortAnimationStartTimeC = this.Time.getVirtualTimeF();
	    }

	    if (this.moveSpriteOffset("body", this.m.DistortTargetPrevC, this.m.DistortTargetC, 3.14, this.m.DistortAnimationStartTimeC))
	    {
	        this.m.DistortAnimationStartTimeC = this.Time.getVirtualTimeF();
	        this.m.DistortTargetPrevC = this.m.DistortTargetC;
	        this.m.DistortTargetC = this.createVec(this.Math.rand(0, 12) - 6, this.Math.rand(0, 12) - 6);
	    }

	    // BLUR 2
	    if (this.m.DistortTargetD == null)
	    {
	        this.m.DistortTargetD = this.createVec(this.Math.rand(0, 12) - 6, this.Math.rand(0, 12) - 6);
	        this.m.DistortAnimationStartTimeD = this.Time.getVirtualTimeF();
	    }

	    if (this.moveSpriteOffset("blur_2", this.m.DistortTargetPrevD, this.m.DistortTargetD, 4.09, this.m.DistortAnimationStartTimeD))
	    {
	        this.m.DistortAnimationStartTimeD = this.Time.getVirtualTimeF();
	        this.m.DistortTargetPrevD = this.m.DistortTargetD;
	        this.m.DistortTargetD = this.createVec(this.Math.rand(0, 12) - 6, this.Math.rand(0, 12) - 6);
	    }
	}

});
*/