package com.android.cen.andrew.laundrybs;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.View;
import android.view.animation.Interpolator;
import android.widget.ImageView;
import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

/**
 * {@link android.view.View.OnClickListener} used to translate the product grid sheet downward on
 * the Y-axis when the navigation icon in the toolbar is pressed.
 */
public class NavigationIconClickListener implements View.OnClickListener {

    private final AnimatorSet animatorSet = new AnimatorSet();
    private Context context;
    private View sheet;
    private Interpolator interpolator;
    private int height;
    private boolean backdropShown = false;
    private Drawable openIcon;
    private Drawable closeIcon;
    private View spin;
    private View spin2;

    NavigationIconClickListener(Context context, View sheet) {
        this(context, sheet, null);
    }

    NavigationIconClickListener(Context context, View sheet, @Nullable Interpolator interpolator) {
        this(context, sheet, interpolator, null, null);
    }

    NavigationIconClickListener(
            Context context, View sheet, @Nullable Interpolator interpolator,
            @Nullable Drawable openIcon, @Nullable Drawable closeIcon) {

        this(context, sheet, interpolator, openIcon, closeIcon, null, null);
    }

    NavigationIconClickListener(
            Context context, View sheet, @Nullable Interpolator interpolator,
            @Nullable Drawable openIcon, @Nullable Drawable closeIcon,
            @Nullable View spin, @Nullable View spin2) {
        this.context = context;
        this.sheet = sheet;
        this.interpolator = interpolator;
        this.openIcon = openIcon;
        this.closeIcon = closeIcon;
        this.spin = spin;
        this.spin2 = spin2;

        DisplayMetrics displayMetrics = new DisplayMetrics();
        ((Activity) context).getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        height = displayMetrics.heightPixels;
    }

    @Override
    public void onClick(View view) {
        backdropShown = !backdropShown;

        // Cancel the existing animations
        animatorSet.removeAllListeners();
        animatorSet.end();
        animatorSet.cancel();

        updateIcon(view);

        final int translateY = height -
                context.getResources().getDimensionPixelSize(R.dimen.reveal);

        Log.d("mytag", String.valueOf(backdropShown ? translateY : 0));
        ObjectAnimator animator = ObjectAnimator.ofFloat(sheet, "translationY", backdropShown ? translateY : 0);

        if (interpolator != null) {
            animator.setInterpolator(interpolator);
        }

        if (spin != null && backdropShown) {
            ObjectAnimator spinner = ObjectAnimator.ofFloat(spin, "rotation", 360);
            ObjectAnimator spinner2 = ObjectAnimator.ofFloat(spin2, "rotation", 360);
            animatorSet.playTogether(animator, spinner, spinner2);
            animatorSet.setDuration(500);
            animatorSet.start();
        } else {
            animator.setDuration(500);
            animator.start();
        }
    }

    private void updateIcon(View view) {
        if (openIcon != null && closeIcon != null) {
            if (!(view instanceof ImageView)) {
                throw new IllegalArgumentException("updateIcon() must be called on an ImageView");
            }
            if (backdropShown) {
                ((ImageView) view).setImageDrawable(closeIcon);
            } else {
                ((ImageView) view).setImageDrawable(openIcon);
            }
        }
    }
}
