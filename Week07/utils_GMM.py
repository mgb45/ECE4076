import numpy as np
import matplotlib.pyplot as plt

from sklearn.cluster import KMeans
from scipy.spatial.distance import cdist
from matplotlib.patches import Ellipse


color_list = ['#1f77b4', '#e377c2', '#ff7f0e', '#2ca02c', '#d62728', 
            '#9467bd', '#8c564b',  '#7f7f7f', 
            '#bcbd22', '#17becf']

def draw_ellipse(position, covariance, ax=None, **kwargs):
    """Draw an ellipse with a given position and covariance"""
    if ax==None:
        ax = plt.gca()
    
    # Convert covariance to principal axes
    if covariance.shape == (2, 2):
        U, s, Vt = np.linalg.svd(covariance)
        angle = np.degrees(np.arctan2(U[1, 0], U[0, 0]))
        width, height = 2 * np.sqrt(s)
    else:
        angle = 0
        width, height = 2 * np.sqrt(covariance)
    
    # Draw the Ellipse
    for nsig in range(1, 4):
        ax.add_patch(Ellipse(position, nsig * width, nsig * height, angle=angle, **kwargs))
        
#============================================================================== 
def plot_kmeans(X, n_clusters=2, ax=None):
    kmeans = KMeans(n_clusters=n_clusters, random_state=0, n_init="auto")
    labels = kmeans.fit_predict(X)


    # plot the input data
    if ax is None:
        ax = plt.gca()
    ax.axis('equal')
    for tmp_label in range(n_clusters):
        tmp_idx = labels == tmp_label
        ax.scatter(X[tmp_idx, 0], X[tmp_idx, 1], c=color_list[tmp_label],
                   s=40, edgecolors="black", zorder=2)

    # plot the representation of the KMeans model
    centers = kmeans.cluster_centers_
    radii = [cdist(X[labels == i], [center]).max() for i, center in enumerate(centers)]
    
    # plot the centers
    ax.scatter(centers[:, 0], centers[:, 1], c="yellow", edgecolor="black", s=100, zorder=3)
    
    tmp_color = 0 #'#CCCCCC'
    for circ_cntr, circ_rad in zip(centers, radii):
        ax.add_patch(plt.Circle(circ_cntr, circ_rad, fc=color_list[tmp_color],
                                lw=3, edgecolor="black", zorder=1))        
        tmp_color += 1

#==============================================================================    
def plot_gmm(gmm, X, ax=None):

    
    labels = gmm.predict(X)
    if ax is None:
        ax = plt.gca()
    ax.axis('equal')
    for tmp_label in range(gmm.n_components):
        tmp_idx = labels == tmp_label
        ax.scatter(X[tmp_idx, 0], X[tmp_idx, 1], c=color_list[tmp_label],
                   s=40, edgecolors="black", zorder=2)
    
    # plot the centers
    ax.scatter(gmm.means_[:, 0], gmm.means_[:, 1], c="yellow", edgecolor="black", s=100, zorder=3)

    w_factor = 0.3 / gmm.weights_.max()
    for pos, covar, w in zip(gmm.means_, gmm.covariances_, gmm.weights_):
        draw_ellipse(pos, covar, alpha=w * w_factor)

#==============================================================================   