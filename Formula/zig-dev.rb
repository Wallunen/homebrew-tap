class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3a6075e0c8b5db6f0d27668d4686ccc39e9994f3d44ceb95ac970340f8d59072" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "05058c5b865bdae7527e1068361ae4a0767ec544e3cb36902840a84e7017589f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "86a98aab988d1895b6f7726a28dd7aed30150e97f2ebeb4f920cae1c80d06cdd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.230+50a141945.tar.xz"
  version "0.13.0-dev.230+50a141945"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
